%% EBA
% Calculate the Equivalent beam angle of ADCP 600kHz.
clf
% Environment variables
c = 1448; %m/s

% ------ 120 kHz ---------
f1 = 90*1000; %Hz
f2 = 170*1000; %Hz
a = 0.152/2; %m

% ------ 200 kHz ----------
%f1 = 155*1000; %Hz
%f2 = 255*1000; %Hz
%a = 0.09/2; %m

% ----------------------------
k1 = pi*f1/c; % 2pi/lambda
k2 = pi*f2/c; % 2pi/lambda

% Range
theta = [-pi/2:0.000001:pi/2];
z1 = k1*a*sin(theta);
z2 = k2*a*sin(theta);

% Functions and beam pattern
b_1 = (2*besselj(1,z1)./z1);
b4_1 = b_1.^4.*sin(theta+pi/2);

b_2 = (2*besselj(1,z2)./z2);
b4_2 = b_2.^4.*sin(theta+pi/2);



plot(rad2deg(theta),10*log10(b4_1), 'DisplayName', '90 kHz');
hold on
plot(rad2deg(theta),10*log10(b4_2), 'DisplayName','170 kHz');
xlabel('Degrees')
ylabel('dB')
ylim([-80,0])
legend()


% Find angle closest to 3dB
[~,angle3db_1] = min(abs(10*log10(b4_1)+3));
[~,angle3db_2] = min(abs(10*log10(b4_2)+3));

% Beam width is angle between 3dB crossings of the beam pattern (symmetric
% here so we find the closest and x2)
BW_1 = abs(rad2deg(theta(angle3db_1)))*2
BW_2 = abs(rad2deg(theta(angle3db_2)))*2

% Checked and at 1500 m/s with 120 nominal frequency the 3dB beam width is 6.9
% degrees.
