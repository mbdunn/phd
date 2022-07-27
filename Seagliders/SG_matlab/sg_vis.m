
path='E:\PolarFront2022\2022-05\seaglider\2022_polarfront_seaglider_sg644\netcdf\';

%List netcdf files in folder
fnamelist = dir([path, 'p*.nc']);
% ncdisp(fname)

% make space for variables
cond_flag =[];
cond = [];
temp = [];
pres = [];
chla = [];
density = [];
lon = [];
lat = [];
x = []; 
time_MATLAB = [];


% SBE 41 data -> repeat for each dive
for ind = 1:size(fnamelist,1)
    fname = [path fnamelist(ind).name];
    time = ncread(fname,'ctd_time'); % unix epoch time
    time_MATLAB = cat(1,time_MATLAB,datetime(time,'ConvertFrom','posixtime'));

    cond_flag = cat(1,cond_flag, ncread(fname,'conductivity_qc'));
    cond      = cat(1,cond,ncread(fname,'conductivity'));
    temp      = cat(1,temp,ncread(fname,'temperature'));
    pres      = cat(1,pres,ncread(fname,'ctd_pressure'));
    %chla      = cat(1,chla,ncread(fname,'wlseaowl_FL1sig'));
    density   = cat(1,density,ncread(fname,'density'));
    lon_dive  = ncread(fname,'longitude');
    lat_dive  = ncread(fname,'latitude');
    
    % get distance -> spacing of this yo is about 0.7 km
    x_dive    = lldistkm([lat_dive,lon_dive],[lat_dive(1),lon_dive(1)]); 
    
    lon       = cat(1,lon,lon_dive);
    lat       = cat(1,lat,lat_dive);
    x         = cat(1,x,x_dive);
end

SP = gsw_SP_from_C(cond*10, temp,pres);


% check out profile,depth and temperature in time with scatter
figure(1)
subplot(311)
scatter(lat,-pres,50,temp,'filled')
ax = gca; ax.FontSize = 12;
xlabel('Latitude'); 
ylabel('P / dbar'),c=colorbar; 
colormap(gca,cmocean('thermal',20));
ylabel(c,'T (raw in-situ) / deg C');
caxis([0 2])
title('Temperature','fontsize',14)
ax = gca; ax.FontSize = 13;

subplot(312)
scatter(lat,-pres,50,SP,'filled')
ax = gca; ax.FontSize = 12;
xlabel('Latitude'); 
ylabel('P / dbar'),c=colorbar; 
colormap(gca,cmocean('haline',20));
ylabel(c,'Salinity/ PSU');
caxis([34.7 35])
title('Salinity', 'fontsize',14)

subplot(313)
scatter(lat,-pres,50,density,'filled')
xlabel('Latitude'); 
ylabel('P / dbar'),c=colorbar; 
colormap(gca,cmocean('deep',20));
ylabel(c,'Density / g/m^3');
caxis([1027.85 1027.95])
title('Density', 'fontsize',14);
ax = gca; ax.FontSize = 12;


% Plot by time
figure(2)
subplot(311)
scatter(time_MATLAB,-pres,50,temp,'filled')
ax = gca; ax.FontSize = 12;
%xlabel('Date'); 
ylabel('Pressure (dbar)', 'fontsize',14);
c=colorbar; 
colormap(gca,cmocean('thermal',20));
ylabel(c,'deg C', 'fontsize',14);
caxis([0.5 2.9])
ylim([-300,0])
title('Temperature','fontsize',14)

subplot(312)
scatter(time_MATLAB,-pres,50,SP,'filled')
ax = gca; ax.FontSize = 12;
%xlabel('Date'); 
ylabel('Pressure (dbar)', 'fontsize',14);
c=colorbar; 
colormap(gca,cmocean('haline',20));
ylabel(c,'PSU', 'fontsize',14);
caxis([34.9 35.05])
ylim([-300,0])
title('Salinity', 'fontsize',14)

subplot(313)
scatter(time_MATLAB,-pres,50,density,'filled')
ax = gca; ax.FontSize = 12;
%xlabel('Date'); 
ylabel('Pressure (dbar)', 'fontsize',14);
c=colorbar; 
colormap(gca,cmocean('deep',20));
ylabel(c,'g/m^3', 'fontsize',14);
caxis([1027.85 1028])
ylim([-300,0])
title('Density', 'fontsize',14);



% figure(3)
% subplot(211)
% scatter(lat,-pres,50,chla,'filled')
% xlabel({'';'Latitude'}); 
% ylabel('P / dbar'),c=colorbar; 
% colormap(gca,cmocean('deep',20));
% ylabel(c,'Fluorescence/');
% caxis([1027.85 1027.95])
% title('Density', 'fontsize',14);
% 
% profile -> needs some corrections for variable flow speed, thermal
% inertia. Since yo's only 0.7 km appart the down/up profiles should look more
% similar than what they currently are. 
% figure(2); 
% plot(SP,temp,'.-k'); 
% ylabel('T / C'); 
% xlabel('Salinity / PSU');
% grid on; 

% next do some analysis 
% -depends on what you want to do... 
% -you can plot all the variables with this template or another. 
% -if you have multiple files you can loop over the nc files and add the
% variables you want.

