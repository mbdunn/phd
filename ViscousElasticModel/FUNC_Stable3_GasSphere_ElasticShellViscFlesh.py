import numpy as np
import csv

def func_GasSphere_ElasticShell_ViscousShell(M_order,R2,R3,R4,ro1,ro2,ro3,ro4,c1,c2,c3,c4,Eta2,Mu3,Landa3,min_freq,max_freq,frequencyNumbers):
    '''
    Created By Babak Khodabandeloo
    Postdoc, Institute of Marine Research, Norway
    Email: khodabandeloo.babak@gmail.com
    Last modified: Feb. 2021
    '''
    
    import numpy as np
#    import matplotlib.pyplot as plt
    from scipy.special import spherical_jn # Spherical Bessel function of the first kind or its derivative.
    from scipy.special import spherical_yn # Spherical Bessel function of the second kind or its derivative.
    
    # https://docs.scipy.org/doc/scipy/reference/special.html
    from scipy.special import legendre
    #plt.close("all")
    
    # http://mathworld.wolfram.com/SphericalHankelFunctionoftheFirstKind.html
    # Spherical Hankel Function of the First Kind
    # The spherical Hankel function of the first kind h1_n(z) is defined by:
    #    h1_n(z)=j_n(z)+i*y_n(z)
    # where j_n(z) and y_n(z) are the spherical Bessel functions of the first and second kinds.
    #%% INPUTs
    #sigma=0.05 # Poisson's ratio
#    ro1=1000    # Surronding Water density  "kg/m³"
#    ro2=1060  # Surronding viscouis layer (fish flesh) density  "kg/m³"
#    ro3=1060  # Elastic sphere Density "kg/m³"
#    ro4=1*1.24  # Inner Gas Sphere Density "kg/m³"
#    
#    c1=1540    # Surronding Water speed of sound "m/s"
#    c2=1540    # Surronding viscouis layer (fish flesh) speed of sound "m/s"
#    c3=1540    # Elastic sphere speed of sound "m/s"
#    c4=1*340     # gas speed of sound "m/s"
    m=M_order
#    Eta2=1*0.43
    Mu2=Eta2
    Kisi2=Mu2+4*Eta2/3
    
#    Mu3=4*1.06E6  # "N/m²" shear rigidity of elastic shell
#    Landa3=4*1149.3E6  # "N/m²" Compressional rigidity of elastic shell
    
#    R2=0.002  # (m) radius till viscous layer
#    R3=0.0005  # (m) radius of elastic shell 
#    R4=0.0003  # (m) radius of gas sphere
    
    R_inf=1  # distance for backscattering Estimation
    
#    min_freq=1*1000  # (Hz) The maximum frequency (Hz) that we want its TS
#    max_freq=300*1000  # (Hz) The maximum frequency (Hz) that we want its TS
#    frequencyNumbers=5000
    freq_vec=np.linspace(min_freq,max_freq,frequencyNumbers)
   
    THETA=np.pi # Scattering Angle (for backscattering THETA=pi)
    # For minnaert resonance ------
#    gama=1.4
#    P0=1*1.1*1E5
#    print('Resonance Minnert: ',str( ((3*gama*P0/ro1)**(0.5))/(2*np.pi*R4) ))
#    TITLE_TXT='Resonance Minnert: '+str( ((3*gama*P0/ro1)**(0.5))/(2*np.pi*R4) )
    
    #%% ==================================================================
    # Spherical bessel functions of first and second kind and their 
    # corresponding derivatives ----------------------------------------
    def spherical_jnFunc(n,z,DerivativeOrder):
        if (DerivativeOrder<2):
         sjnFunc = spherical_jn(n,z,DerivativeOrder)
        elif (DerivativeOrder==2):
         sjnFunc=( -2*z*spherical_jn(n,z,1)-(z*z-n*n-n)*spherical_jn(n,z,0) )/(z*z)   
        return sjnFunc
    
    def spherical_ynFunc(n,z,DerivativeOrder):
        if (DerivativeOrder<2):
         synFunc = spherical_yn(n,z,DerivativeOrder)
        elif (DerivativeOrder==2):
         synFunc=( -2*z*spherical_yn(n,z,1)-(z*z-n*n-n)*spherical_yn(n,z,0) )/(z*z) 
        return synFunc
    
    def LegendreFunc(x,n):
        leg = legendre(n)
        P_n= leg(x)
        return P_n
    
    #%% ==================================================
    def h_func(m,z):
        h_val=np.zeros((m+1), dtype=complex)
        SUM_11_152_Arfken=np.zeros((1), dtype=complex)
        xx=np.real(z)
        h_val[0]=(1/z)*(np.sin(xx)-1j*np.cos(xx))
        if m==1:
           h_val[1]=(h_val[0])*(1/z-1j)
        elif m==2:
           h_val[2]=(np.cos(xx)+1j*np.sin(xx))*(1j/z-3/(z*z)-3*1j/(z*z*z))
        elif m>2:
          for s in range(0,m+1):
              m_plus_s_fact=np.math.factorial(m+s)
              m_mins_s_fact=np.math.factorial(m-s)
              s_fact=np.math.factorial(s)
              SUM_11_152_Arfken=SUM_11_152_Arfken+(m_plus_s_fact*(1j**s))/(s_fact*m_mins_s_fact*((2*z)**s))
          h_val[m]=SUM_11_152_Arfken*((-1j)**(m+1))*(np.cos(xx)+1j*np.sin(xx))/z 
        return h_val[m]
    
    def dh_func(m,z):
        dh_val=np.zeros((1), dtype=complex)
        if m==0:
           dh_val=-h_func(1,z)
        elif m>0:
           dh_val=h_func(m-1,z)-((m+1)/z)*h_func(m,z)
        return dh_val
       
    def ddh_func(m,z):
        ddh_val=np.zeros((1), dtype=complex)
        ddh_val=(1/(z*z))*( (m*m+m-z*z)*h_func(m,z)-2*z*dh_func(m,z) )
       
        return ddh_val

 
    #%% ==================================================
    
    
    
    Am_Vec=np.array([],dtype=complex)
    Am_Pm_h0_k1_R_inf_Vec=np.array([],dtype=complex)
    
    for ii in range(0,np.size(freq_vec,0)):
      f=freq_vec[ii]
      w=2*np.pi*f
      
      # M*a=F
      if M_order==0:
        M_Matrix=np.zeros((6,6),dtype=complex)
        F_Matrix=np.zeros((6,1),dtype=complex)
      else:
        M_Matrix=np.zeros((10,10),dtype=complex)
        F_Matrix=np.zeros((10,1),dtype=complex)  
     
      
      k1=w/c1
      
 
      k_c2=(w/c2)*((1-1j*w*Kisi2/(ro2*c2*c2))**-0.5)
      k_s2=(1+1j)*(w*ro2/(2*Eta2))**0.5
      k_s2sq=1j*w*ro2/Eta2
      
      k_c3=w*((ro3/(Landa3+2*Mu3))**0.5)
      k_s3=w*((ro3/Mu3)**0.5)
      
      k4=w/c4
      
      ## BESSEL functions and their derivatives ==================================================================================================
      jm_k1_R2=spherical_jnFunc(m,k1*R2,0)  # Spherical Bessel function of first kind and order "m" at (k1*R2)
      djm_k1_R2=spherical_jnFunc(m,k1*R2,1)  # First derivative of Spherical Bessel function of first kind and order "m"at (k1*R2)
        
#      hm_k1R2=spherical_jnFunc(m,k1*R2,0)+1j*spherical_ynFunc(m,k1*R2,0)  # Spherical Hankel function of first kind order "m" at (k1R2)
#      dhm_k1R2=spherical_jnFunc(m,k1*R2,1)+1j*spherical_ynFunc(m,k1*R2,1)  # First derivative of Spherical Hankel function of order "m" at (k1R2)
     
      jm_kc2_R2=spherical_jnFunc(m,k_c2*R2,0)  # Spherical Bessel function of first kind and order "m" at (k_L2*R2)  
      djm_kc2_R2=spherical_jnFunc(m,k_c2*R2,1)  # First derivative of Spherical Bessel function of first kind and order "m" at (k_L2*R2)
      ddjm_kc2_R2=spherical_jnFunc(m,k_c2*R2,2)  # Second derivative of Spherical Bessel function of first kind and order "m" at (k_L2*R2)
      
      jm_ks2_R2=spherical_jnFunc(m,k_s2*R2,0)  # Spherical Bessel function of first kind and order "m" at (k_L2*R2)  
      djm_ks2_R2=spherical_jnFunc(m,k_s2*R2,1)  # First derivative of Spherical Bessel function of first kind and order "m" at (k_L2*R2)
      ddjm_ks2_R2=spherical_jnFunc(m,k_s2*R2,2)  # Second derivative of Spherical Bessel function of first kind and order "m" at (k_L2*R2)
      

      jm_kc2_R3=spherical_jnFunc(m,k_c2*R3,0)  # Spherical Bessel function of first kind and order "m" at (k_L2*R3)  
      djm_kc2_R3=spherical_jnFunc(m,k_c2*R3,1)  # First derivative of Spherical Bessel function of first kind and order "m" at (k_L2*R3)
      ddjm_kc2_R3=spherical_jnFunc(m,k_c2*R3,2)  # Second derivative of Spherical Bessel function of first kind and order "m" at (k_L2*R3)
      
      jm_ks2_R3=spherical_jnFunc(m,k_s2*R3,0)  # Spherical Bessel function of first kind and order "m" at (k_L2*R2)  
      djm_ks2_R3=spherical_jnFunc(m,k_s2*R3,1)  # First derivative of Spherical Bessel function of first kind and order "m" at (k_L2*R2)
      ddjm_ks2_R3=spherical_jnFunc(m,k_s2*R3,2)  # First derivative of Spherical Bessel function of first kind and order "m" at (k_L2*R2)
            

      jm_kc3_R3=spherical_jnFunc(m,k_c3*R3,0)  # Spherical Bessel function of first kind and order "m" at (k_L2*R3)  
      djm_kc3_R3=spherical_jnFunc(m,k_c3*R3,1)  # First derivative of Spherical Bessel function of first kind and order "m" at (k_L2*R3)
      ddjm_kc3_R3=spherical_jnFunc(m,k_c3*R3,2)  # Second derivative of Spherical Bessel function of first kind and order "m" at (k_L2*R3)
      
      jm_ks3_R3=spherical_jnFunc(m,k_s3*R3,0)  # Spherical Bessel function of first kind and order "m" at (k_L2*R2)  
      djm_ks3_R3=spherical_jnFunc(m,k_s3*R3,1)  # First derivative of Spherical Bessel function of first kind and order "m" at (k_L2*R2)
      ddjm_ks3_R3=spherical_jnFunc(m,k_s3*R3,2)  # second derivative of Spherical Bessel function of first kind and order "m" at (k_L2*R2)
      

      jm_kc3_R4=spherical_jnFunc(m,k_c3*R4,0)  # Spherical Bessel function of first kind and order "m" at (k_L3*R4)  
      djm_kc3_R4=spherical_jnFunc(m,k_c3*R4,1)  # First derivative of Spherical Bessel function of first kind and order "m" at (k_L3*R4)
      ddjm_kc3_R4=spherical_jnFunc(m,k_c3*R4,2)  # First derivative of Spherical Bessel function of first kind and order "m" at (k_L3*R4)
      
      jm_ks3_R4=spherical_jnFunc(m,k_s3*R4,0)  # Spherical Bessel function of first kind and order "m" at (k_L2*R2)  
      djm_ks3_R4=spherical_jnFunc(m,k_s3*R4,1)  # First derivative of Spherical Bessel function of first kind and order "m" at (k_L2*R2)
      ddjm_ks3_R4=spherical_jnFunc(m,k_s3*R4,2)  # Second derivative of Spherical Bessel function of first kind and order "m" at (k_L2*R2)
      

      jm_k4_R4=spherical_jnFunc(m,k4*R4,0)  # Spherical Bessel function of first kind and order "m" at (k4*R4) 
      djm_k4_R4=spherical_jnFunc(m,k4*R4,1)  # First derivative of Spherical Bessel function of first kind and order "m" at (k4*R4)
      ## BESSEL functions and their derivatives ==================================================================================================
      
      if m==0:
#          M_Matrix[0,0]=k1*dhm_k1R2
          M_Matrix[0,0]=k1*dh_func(m,k1*R2)
          M_Matrix[0,1]=-k_c2*djm_kc2_R2
#          M_Matrix[0,2]=-k_c2*dhm_kc2_R2
          M_Matrix[0,2]=-k_c2*dh_func(m,k_c2*R2)
          
          
          F_Matrix[0,0]=-k1*(1j**m)*(2*m+1)*djm_k1_R2
          
#          M_Matrix[1,0]=-1j*w*ro1*hm_k1R2
          M_Matrix[1,0]=-1j*w*ro1*h_func(m,k1*R2)
          M_Matrix[1,1]=-Eta2*(2*k_c2*k_c2-k_s2sq)*jm_kc2_R2-2*Eta2*k_c2*k_c2*ddjm_kc2_R2
          M_Matrix[1,2]=-Eta2*(2*k_c2*k_c2-k_s2sq)*h_func(m,k_c2*R2)-2*Eta2*k_c2*k_c2*ddh_func(m,k_c2*R2)
         
          F_Matrix[1,0]=1j*w*ro1*(1j**m)*(2*m+1)*jm_k1_R2
         
          M_Matrix[2,1]=k_c2*djm_kc2_R3
          M_Matrix[2,2]=k_c2*dh_func(m,k_c2*R3)
          M_Matrix[2,3]=-k_c3*djm_kc3_R3
          M_Matrix[2,4]=-k_c3*dh_func(m,k_c3*R3)
          
          M_Matrix[3,1]=-1j*w*Eta2*(2*k_c2*k_c2-k_s2sq)*jm_kc2_R3-2*(1j*w)*Eta2*k_c2*k_c2*ddjm_kc2_R3
          M_Matrix[3,2]=-1j*w*Eta2*(2*k_c2*k_c2-k_s2sq)*h_func(m,k_c2*R3)-2*(1j*w)*Eta2*k_c2*k_c2*ddh_func(m,k_c2*R3)
          M_Matrix[3,3]=-Mu3*(2*k_c3*k_c3-k_s3*k_s3)*jm_kc3_R3-2*Mu3*k_c3*k_c3*ddjm_kc3_R3
          M_Matrix[3,4]=-Mu3*(2*k_c3*k_c3-k_s3*k_s3)*h_func(m,k_c3*R3)-2*Mu3*k_c3*k_c3*ddh_func(m,k_c3*R3)
          
          M_Matrix[4,3]=k_c3*djm_kc3_R4
          M_Matrix[4,4]=k_c3*dh_func(m,k_c3*R4)
          M_Matrix[4,5]=-k4*djm_k4_R4
          
          M_Matrix[5,3]=Mu3*(2*k_c3*k_c3-k_s3*k_s3)*jm_kc3_R4+2*Mu3*k_c3*k_c3*ddjm_kc3_R4
          M_Matrix[5,4]=Mu3*(2*k_c3*k_c3-k_s3*k_s3)*h_func(m,k_c3*R4)+2*Mu3*k_c3*k_c3*ddh_func(m,k_c3*R4)
          M_Matrix[5,5]=w*w*ro4*jm_k4_R4
        
      else:
         #1 Continuity of Normal Velocity Between I & II @ r=R2
#          M_Matrix[0,0]=k1*R2*dhm_k1R2
          M_Matrix[0,0]=k1*R2*dh_func(m,k1*R2)
          M_Matrix[0,1]=-k_c2*R2*djm_kc2_R2
          M_Matrix[0,2]=-k_c2*R2*dh_func(m,k_c2*R2)
          M_Matrix[0,3]=(m)*(m+1)*jm_ks2_R2
          M_Matrix[0,4]=(m)*(m+1)*h_func(m,k_s2*R2)
          
          F_Matrix[0,0]=-k1*R2*(1j**m)*(2*m+1)*djm_k1_R2
          
          #2 Continuity of Normal Stress Between I & II @ r=R2
#          M_Matrix[1,0]=-1j*w*ro1*R2*R2*hm_k1R2
          M_Matrix[1,0]=-1j*w*ro1*R2*R2*h_func(m,k1*R2)
          M_Matrix[1,1]=-Eta2*R2*R2*(2*k_c2*k_c2-k_s2sq)*jm_kc2_R2 - 2*Eta2*R2*R2*k_c2*k_c2*ddjm_kc2_R2
          M_Matrix[1,2]=-Eta2*R2*R2*(2*k_c2*k_c2-k_s2sq)*h_func(m,k_c2*R2) - 2*Eta2*R2*R2*k_c2*k_c2*ddh_func(m,k_c2*R2)
          M_Matrix[1,3]=-2*Eta2*(-m)*(m+1)*k_s2*R2*djm_ks2_R2 + 2*Eta2*(-m)*(m+1)*jm_ks2_R2   
          M_Matrix[1,4]=-2*Eta2*(-m)*(m+1)*k_s2*R2*dh_func(m,k_s2*R2) + 2*Eta2*(-m)*(m+1)*h_func(m,k_s2*R2)
          
          F_Matrix[1,0]=(1j*w)*ro1*R2*R2*(1j**m)*(2*m+1)*jm_k1_R2
         
          #3 Tangential Stress equal to zero between I & II @ r=R2
          M_Matrix[2,1]=2*k_c2*R2*djm_kc2_R2 - 2*jm_kc2_R2
          M_Matrix[2,2]=2*k_c2*R2*dh_func(m,k_c2*R2) - 2*h_func(m,k_c2*R2)
          M_Matrix[2,3]=-k_s2sq*R2*R2*ddjm_ks2_R2 + 2*jm_ks2_R2 + (-m)*(m+1)*jm_ks2_R2
          M_Matrix[2,4]=-k_s2sq*R2*R2*ddh_func(m,k_s2*R2) + 2*h_func(m,k_s2*R2) + (-m)*(m+1)*h_func(m,k_s2*R2)
          
          #4 Continuity of Normal Velocity Between II & III @ r=R3
          M_Matrix[3,1]=k_c2*R3*djm_kc2_R3
          M_Matrix[3,2]=k_c2*R3*dh_func(m,k_c2*R3)
          M_Matrix[3,3]=(-m)*(m+1)*jm_ks2_R3
          M_Matrix[3,4]=(-m)*(m+1)*h_func(m,k_s2*R3)
          M_Matrix[3,5]=-k_c3*R3*djm_kc3_R3
          M_Matrix[3,6]=-k_c3*R3*dh_func(m,k_c3*R3)
          M_Matrix[3,7]=(m)*(m+1)*jm_ks3_R3
          M_Matrix[3,8]=(m)*(m+1)*h_func(m,k_s3*R3)
          
          
          #5 Continuity of Normal Stress Between II & III @ r=R3
          M_Matrix[4,1]=(-1j*w)*Eta2*(2*k_c2*k_c2-k_s2sq)*R3*R3*jm_kc2_R3 + (-1j*w)*2*Eta2*k_c2*k_c2*R3*R3*ddjm_kc2_R3
          M_Matrix[4,2]=(-1j*w)*Eta2*(2*k_c2*k_c2-k_s2sq)*R3*R3*h_func(m,k_c2*R3) + (-1j*w)*2*Eta2*k_c2*k_c2*R3*R3*ddh_func(m,k_c2*R3)
          M_Matrix[4,3]=(-1j*w)*2*Eta2*R3*(-m)*(m+1)*k_s2*djm_ks2_R3 - (-1j*w)*2*Eta2*(-m)*(m+1)*jm_ks2_R3
          M_Matrix[4,4]=(-1j*w)*2*Eta2*R3*(-m)*(m+1)*k_s2*dh_func(m,k_s2*R3) - (-1j*w)*2*Eta2*(-m)*(m+1)*h_func(m,k_s2*R3)
          M_Matrix[4,5]=-Mu3*(2*k_c3*k_c3-k_s3*k_s3)*R3*R3*jm_kc3_R3 - 2*Mu3*k_c3*k_c3*R3*R3*ddjm_kc3_R3
          M_Matrix[4,6]=-Mu3*(2*k_c3*k_c3-k_s3*k_s3)*R3*R3*h_func(m,k_c3*R3) - 2*Mu3*k_c3*k_c3*R3*R3*ddh_func(m,k_c3*R3)
          M_Matrix[4,7]=-2*Mu3*(-m)*(m+1)*k_s3*R3*djm_ks3_R3 + 2*Mu3*(-m)*(m+1)*jm_ks3_R3
          M_Matrix[4,8]=-2*Mu3*(-m)*(m+1)*k_s3*R3*dh_func(m,k_s3*R3) + 2*Mu3*(-m)*(m+1)*h_func(m,k_s3*R3)
          
          #6 Continuity of Tangential Stress Between II & III @ r=R3
          M_Matrix[5,1]=(-1j*w)*2*Eta2*k_c2*R3*djm_kc2_R3 - (-1j*w)*2*Eta2*jm_kc2_R3
          M_Matrix[5,2]=(-1j*w)*2*Eta2*k_c2*R3*dh_func(m,k_c2*R3) - (-1j*w)*2*Eta2*h_func(m,k_c2*R3)
          M_Matrix[5,3]=(1j*w)*Eta2*k_s2sq*R3*R3*ddjm_ks2_R3 + (-1j*w)*2*Eta2*jm_ks2_R3 + (-1j*w)*Eta2*(-m)*(m+1)*jm_ks2_R3
          M_Matrix[5,4]=(1j*w)*Eta2*k_s2sq*R3*R3*ddh_func(m,k_s2*R3) + (-1j*w)*2*Eta2*h_func(m,k_s2*R3) + (-1j*w)*Eta2*(-m)*(m+1)*h_func(m,k_s2*R3)
          M_Matrix[5,5]=-2*Mu3*k_c3*R3*djm_kc3_R3 + 2*Mu3*jm_kc3_R3
          M_Matrix[5,6]=-2*Mu3*k_c3*R3*dh_func(m,k_c3*R3) + 2*Mu3*h_func(m,k_c3*R3)
          M_Matrix[5,7]=Mu3*k_s3*k_s3*R3*R3*ddjm_ks3_R3 - 2*Mu3*jm_ks3_R3 - Mu3*(-m)*(m+1)*jm_ks3_R3
          M_Matrix[5,8]=Mu3*k_s3*k_s3*R3*R3*ddh_func(m,k_s3*R3) - 2*Mu3*h_func(m,k_s3*R3) - Mu3*(-m)*(m+1)*h_func(m,k_s3*R3)
          
          #7 Continuity of Tangential velocity Between II & III @ r=R3
          M_Matrix[6,1]=jm_kc2_R3
          M_Matrix[6,2]=h_func(m,k_c2*R3)
          M_Matrix[6,3]=-jm_ks2_R3-k_s2*R3*djm_ks2_R3
          M_Matrix[6,4]=-h_func(m,k_s2*R3)-k_s2*R3*dh_func(m,k_s2*R3)
          M_Matrix[6,5]=-jm_kc3_R3
          M_Matrix[6,6]=-h_func(m,k_c3*R3)
          M_Matrix[6,7]=jm_ks3_R3+k_s3*R3*djm_ks3_R3
          M_Matrix[6,8]=h_func(m,k_s3*R3)+k_s3*R3*dh_func(m,k_s3*R3)
          
          #8 Continuity of Normal velocity Between III & IV @ r=R4
          M_Matrix[7,5]=k_c3*R4*djm_kc3_R4
          M_Matrix[7,6]=k_c3*R4*dh_func(m,k_c3*R4)
          M_Matrix[7,7]=(-m)*(m+1)*jm_ks3_R4
          M_Matrix[7,8]=(-m)*(m+1)*h_func(m,k_s3*R4)
          M_Matrix[7,9]=-k4*R4*djm_k4_R4 
          
          #9 Continuity of Normal Stress Between III & IV @ r=R4
          M_Matrix[8,5]=Mu3*(2*k_c3*k_c3-k_s3*k_s3)*R4*R4*jm_kc3_R4 + 2*Mu3*k_c3*k_c3*R4*R4*ddjm_kc3_R4
          M_Matrix[8,6]=Mu3*(2*k_c3*k_c3-k_s3*k_s3)*R4*R4*h_func(m,k_c3*R4) + 2*Mu3*k_c3*k_c3*R4*R4*ddh_func(m,k_c3*R4)
          M_Matrix[8,7]=2*Mu3*(-m)*(m+1)*k_s3*R4*djm_ks3_R4 - 2*Mu3*(-m)*(m+1)*jm_ks3_R4
          M_Matrix[8,8]=2*Mu3*(-m)*(m+1)*k_s3*R4*dh_func(m,k_s3*R4) - 2*Mu3*(-m)*(m+1)*h_func(m,k_s3*R4)
          M_Matrix[8,9]=w*w*ro4*R4*R4*jm_k4_R4
          
          #10 Tangential Stress of III @ r=R4 should be zero
          M_Matrix[9,5]=2*Mu3*k_c3*R4*djm_kc3_R4 - 2*Mu3*jm_kc3_R4
          M_Matrix[9,6]=2*Mu3*k_c3*R4*dh_func(m,k_c3*R4) - 2*Mu3*h_func(m,k_c3*R4)
          M_Matrix[9,7]=-Mu3*k_s3*k_s3*R4*R4*ddjm_ks3_R4 + 2*Mu3*jm_ks3_R4 + Mu3*(-m)*(m+1)*jm_ks3_R4
          M_Matrix[9,8]=-Mu3*k_s3*k_s3*R4*R4*ddh_func(m,k_s3*R4) + 2*Mu3*h_func(m,k_s3*R4) + Mu3*(-m)*(m+1)*h_func(m,k_s3*R4)

        
      ResultVec=np.linalg.inv(M_Matrix)@F_Matrix
      Am_Vec=np.append(Am_Vec,ResultVec[0]) 
     
      #  h0_k1_R_inf=1
#      Am_Pm_h0_k1_R_inf=ResultVec[0]*LegendreFunc(np.cos(THETA),m)*(spherical_jnFunc(m,k1*R_inf,0)+1j*spherical_ynFunc(m,k1*R_inf,0))  # Spherical Hankel function of first kind order "n" at (k1*R_inf)
      Am_Pm_h0_k1_R_inf=ResultVec[0]*((-1)**m)*(spherical_jnFunc(m,k1*R_inf,0)+1j*spherical_ynFunc(m,k1*R_inf,0))  # Spherical Hankel function of first kind order "n" at (k1*R_inf)
           
      Am_Pm_h0_k1_R_inf_Vec=np.append(Am_Pm_h0_k1_R_inf_Vec,Am_Pm_h0_k1_R_inf)  
      
#    print('Resonance Minnert: ',str(3.26/R4))
#    TITLE_TXT='Resonance Minnert: '+str(3.26/R4)
      
#    TS=10*np.log10(A01_Vec/(4*np.pi)) # TS should divided by 4*pi if backscattering cross section is defiend by multiplying by 4*pi
#    plt.plot(freq_vec/1000,TS,color='r',linestyle='--',label='Visco-elsastic Resonance Model, R='+str(1000*a)+'mm')
#    plt.xlabel('TS (dB)',fontsize=14)
#    plt.xlabel('kHz',fontsize=14)
#    plt.xticks(fontsize = 14)
#    plt.yticks(fontsize = 14)
#    
#    plt.show()
#    
#
#    plt.title('Spherical gas bubble in water',fontsize=14)
#    #plt.legend(['R_0=0.1 mm','R_0=0.1 mm'],loc='upper right',prop={'size': 12}) 
#    plt.legend(loc='upper right',prop={'size': 12}, fontsize='small', ncol=1) 
#    plt.grid(color=[0.7,0.7,0.7], linestyle='--', linewidth=0.5)
      return Am_Vec, Am_Pm_h0_k1_R_inf_Vec 


def run_ve(Freq_vec, M_order, params):
    """Function to run the viscous elastic model (Khodabandeloo et al. 2021) for a range of frequencies
    Freq_vec: frequency vector
    M_order: number of modes included
    params: dictionary including a value for each model parameter required (R2,R3,R4,ro1,ro2,ro3,ro4,c1,c2,c3,c4,Eta2,Mu3,Landa3)
    """ 
    cntr=0
    TS_vec=[]
    for freq in Freq_vec:
        min_freq=freq
        max_freq=min_freq
        frequencyNumbers=1
        cntr=cntr+1
        
        SUM_Am_Pm_h_k1_R_inf_Vec=np.zeros(1,dtype=complex)
        
        for m_order in range(0,M_order):
            [Am_Vec, Am_Pm_h_k1_R_inf_Vec]=func_GasSphere_ElasticShell_ViscousShell(m_order,
                                                                                      params['R2'],
                                                                                      params['R3'],
                                                                                      params['R4'],
                                                                                      params['ro1'],
                                                                                      params['ro2'],
                                                                                      params['ro3'],
                                                                                      params['ro4'],
                                                                                      params['c1'],
                                                                                      params['c2'],
                                                                                      params['c3'],
                                                                                      params['c4'],
                                                                                      params['Eta2'],
                                                                                      params['Mu3'],
                                                                                      params['Landa3'],
                                                                                      min_freq,
                                                                                      max_freq,
                                                                                      frequencyNumbers)
                
            SUM_Am_Pm_h_k1_R_inf_Vec=SUM_Am_Pm_h_k1_R_inf_Vec+Am_Pm_h_k1_R_inf_Vec  

        TS=10*np.log10((abs(SUM_Am_Pm_h_k1_R_inf_Vec))**2)
        TS_vec=np.append(TS_vec,TS)

    return TS_vec


def write_ve(fname_txt, M_order, params, F_TS_MAT):
    """|||||||||||||||   Save into txt file   |||||||||||||||||||||||||||| 
    fname_txt: Name of the txt file to save values.
    M_order: number of modes included
    params: dictionary including a value for each model parameter required (R2,R3,R4,ro1,ro2,ro3,ro4,c1,c2,c3,c4,Eta2,Mu3,Landa3)
    F_TS_MAT: frequency vector and ts results concatenated
    """
    with open(fname_txt, 'w') as f:
        csv.writer(f, delimiter=' ').writerows(F_TS_MAT)  

    # Add header
    Parameters='M='+str(M_order-1)+' GasRadii_m_(R4)='+str(params['R4'])+' R3='+str(params['R3'])+' R2='+str(params['R2'])+ \
                   ' ro_water_(ro1)='+str(params['ro1'])+' ro_gas_(ro4)='+str(params['ro4'])+' ro_shell_(ro3)='+str(params['ro3'])+'ro_flesh_(ro2)='+str(params['ro2'])+ \
               ' c_water_(c1)='+str(params['c1'])+' c_gas (c4)='+str(params['c4'])+' c_shell_(c3)='+str(params['c3'])+' c_flesh_(c2)='+str(params['c2'])+' Kisi='+str(params['Kisi2'])+ \
               ' Shear_Rigidity_(mu3)='+str(params['Mu3'])+' Compressional_rigidity_of_elastic_shell_(Landa3)='+str(params['Landa3']) 


    headers = Parameters.split()

    with open(fname_txt,'r+') as infile:
      content = infile.read()
      infile.seek(0,0)
      infile.write("\t".join(headers)+"\n"+content)
    
    return