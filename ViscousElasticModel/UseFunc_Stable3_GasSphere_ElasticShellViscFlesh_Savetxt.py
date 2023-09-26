import numpy as np
import matplotlib.pyplot as plt
import csv

SaveDir='/home/bkh/OnlineCourses/Swimbladder_Viscosity/txtFilesViscousElastic/'
TextfileName='OutFile.txt'
TXTDirFile=SaveDir+TextfileName

import os
os.chdir('//home/bkh/OnlineCourses/BackScattering/BackscatterAnalyticSpheres/')
from FUNC_Stable3_GasSphere_ElasticShellViscFlesh import func_GasSphere_ElasticShell_ViscousShell


M_order=3

ro1=1027    # Surronding Water density  "kg/m³"
ro2=1040  # Surronding viscouis layer (fish flesh) density  "kg/m³"
ro3=1040  # Elastic sphere Density "kg/m³"
ro4=80  # Inner Gas Sphere Density "kg/m³"
 
c1=1500    # Surronding Water speed of sound "m/s"
c2=1510    # Surronding viscouis layer (fish flesh) speed of sound "m/s"
#c3=1480    # Elastic sphere speed of sound "m/s"
c4=325    # gas speed of sound "m/s"

Eta2=3#2*0.428572
Mu2=Eta2
Kisi2=Mu2+4*Eta2/3
    
Mu3=0.2*1.0E6  # "N/m²" shear rigidity of elastic shell
Landa3=2.4*1E9  # "N/m²" Compressional rigidity of elastic shell

c3=(ro3/(Landa3+2*Mu3))**-0.5    # Elastic sphere speed of sound "m/s"
    
Delta=0.02*1E-3
R4=1*1E-3 #0.001  # (m) radius of gas sphere
R3=R4+Delta  # (m) radius of elastic shell 
#R2=2*1E-3  # (m) radius till viscous layer
R2=R4*( (1+(ro1-ro4)/(ro2-ro1))**(1/3) ) # Eq 18 in our JASA mesopelagic paper


min_freq=1*1000
max_freq=150*1000
frequencySpacing=100

Freq_vec=np.arange(min_freq,max_freq,frequencySpacing) 
TS_vec=[]
cntr=0

for freq in Freq_vec:
    min_freq=freq
    max_freq=min_freq
    frequencyNumbers=1
    cntr=cntr+1
    if (cntr % 200 ==0):
        print('Frequency='+str(freq))


    #||||| Frequency Dependent Mu3 (shear modulus)
#    Mu3=0.01E6+((freq-min_freq)/(max_freq-min_freq))*(0.99E6)
 
    SUM_Am_Pm_h_k1_R_inf_Vec=np.zeros(1,dtype=complex)
    for m_order in range(0,M_order):
          [Am_Vec, Am_Pm_h_k1_R_inf_Vec]=func_GasSphere_ElasticShell_ViscousShell(m_order,R2,R3,R4,ro1,ro2,ro3,ro4,c1,c2,c3,c4,Eta2,Mu3,Landa3,min_freq,max_freq,frequencyNumbers)
          SUM_Am_Pm_h_k1_R_inf_Vec=SUM_Am_Pm_h_k1_R_inf_Vec+Am_Pm_h_k1_R_inf_Vec  
            
    TS=10*np.log10((abs(SUM_Am_Pm_h_k1_R_inf_Vec))**2)
    TS_vec=np.append(TS_vec,TS)
    
#plt.plot(FreqVec/1000,TS_vec,linestyle='-',marker='s',markersize=4,label='2.5mm Spheroid, Asp R=4, Theta =90')  
plt.plot(Freq_vec/1000,TS_vec,color=[0.6,0.6,0.6],linestyle='-',label='2.5mm Spheroid, Asp R=4, Theta =90')  
plt.show()  

#plt.plot(R4*2*np.pi*Freq_vec/c1,TS_vec,color=[0.6,0.6,0.6],linestyle='-',label='2.5mm Spheroid, Asp R=4, Theta =90')  
#plt.show()  


#COMSOLDIR='/home/bkh/OnlineCourses/BackScattering/COMSOL_data/'
#COMSOL_txt='TS_Air_Req2p5mm_AspRatio1_90deg.txt'
#COMSOL_DIR_File=COMSOLDIR+COMSOL_txt
#f=open(COMSOL_DIR_File, "r")
#contents =f.read()
#
#with open(COMSOL_DIR_File) as myFile1:
#    content1 = myFile1.readlines()
#    
#    Freq_TS_mat=np.loadtxt(content1[8:len(content1)])
#
#plt.plot(Freq_TS_mat[:,0]/1000,Freq_TS_mat[:,1],linestyle='-',marker='o',markersize=4,label='2.5mm Spheroid, Asp R=4, Theta =90')
#%%   
# Concatenate two column vector "Nx1" in marix "Nx2"
F_TS_MAT=np.concatenate((Freq_vec.reshape(-1,1),TS_vec.reshape(-1,1)),axis=1)
plt.plot(F_TS_MAT[:,0],F_TS_MAT[:,1])
     
#file=open(TXTDirFile, 'w')

## Write the data into the file
##file=open(TXTDirFile,'r+')      
#np.savetxt(file,F_TS_MAT,"%.2f",delimiter=',')   


#  |||||||||||||||   Save into txt file   ||||||||||||||||||||||||||||
with open(TXTDirFile, 'w') as f:
    csv.writer(f, delimiter=' ').writerows(F_TS_MAT)  

# Add header
Parameters='M='+str(M_order-1)+' GasRadii_m='+str(R4)+' R3='+str(R3)+' R2='+str(R2)+ \
           ' ro_water='+str(ro1)+' ro_gas='+str(ro4)+' ro_shell='+str(ro3)+' ro_flesh='+str(ro2)+ \
           ' c_water='+str(c1)+' c_gas='+str(c4)+' c_shell='+str(c3)+' c_flesh='+str(c2)+' Kisi='+str(Kisi2)+ \
           ' Shear_Rigidity_(mu3)='+str(Mu3)+' Compressional_rigidity_of_elastic_shell_(Landa3)='+str(Landa3) 
           
           
headers = Parameters.split()

with open(TXTDirFile,'r+') as infile:
  content = infile.read()
  infile.seek(0,0)
  infile.write("\t".join(headers)+"\n"+content)