%% Extended version of the model presented in Mariotti and Carr 2014 & Marioti & Fagherazzi 2013 %%%%%%%
% clc; clear all; close all;
%% Inputs from main code
% Enet=E_star;
% We=We_star;
% Qow_max=Qow_star;
% bm1c=bm1c_star;
% Ke=ke_star;
%% Manual Inputs
Enet=0; % [m/y] Shoreface net erosion rate
We=400;% [m] Critical barrier width
Qow_max=10; % [m^2/y] Maximum overwash
bm1c=400;% [m] Critical Marsh width 
Ke=0.3; % [m^3/yr/W] bank erosion coeff (Mariotti and Fagherazzi 2013)
Vd_max=100;%We*H; % [m^2] Maximum deficit volume
wind=4; % Wind speed [m/s]
Ka=2; % [-] shape factor that captures the geometry of the marsh boundary (Mariotti and Fagherazzi 2013)

%% Input Parameter values %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
B=0.001; %[-] Mainland slope
zdot=0.0031; %sea-level rise rate [m/yr]. Use zdot values that are higher than 2.7 mm/y, which is the maximum accumulation rate at biomass.
%% Barrier %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Enet=10.5; % [m/y] Shoreface net erosion rate
H=6;% [m] Barrier height.
Zo=8;% [m] Initial shoreface depth.
% We=500;% [m] Critical barrier width
% Qow_max=100; % [m^2/y] Maximum overwash
% Vd_max=1000;%We*H; % [m^2] Maximum deficit volume
Dc=Zo; % [m] Constant Shoreface Depth
%% MARSH-Lagoon Input parameters%%%%%%%%%%%%%%%
po=1000; %organic sediment density [kg/m^3]
dist=10; %parameter for marsh erosion [m]
rng=1.56; %tidal range [m]
% wind=5; % Wind speed [m/s]
% Ka=2; % [-] shape factor that captures the geometry of the marsh boundary (Mariotti and Fagherazzi 2013)
% Ke=0.12; % [m^3/yr/W] bank erosion coeff (Mariotti and Fagherazzi 2013)
zL=2;% [m] Lagoon depth respect to MHW
zm=0.15;% [m] Marsh depth respect to MHW
% bm1c=200;%733.33;% [m] Critical Marsh width 
%% Progradation rate (m/y) %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Cr=0.001;% Reference concentration in the lagoon (g/l =kg/m3) 
ws=0.5*10^-3*(365*24*3600); %settling velocity [m/yr]  (0.5 mm/s multiplied my the conversion factor)
Ba=Ka*Cr*ws/po; % Progradation rate (m/y)
%% Initial Conditions %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
bLo=3452; % [m] Initial lagoon width
bm2o=1962; % [m] Initial inland marsh width
bm1o=191; % [m] Initial backbarrier marsh wdth
Lmo=bm1o+bm2o;% [m] Initial total marsh width
LB=Lmo+bLo;% [m] Length of Basin
xso=0;
xbo=372; % [m] Initial barrier width 
xs=xso; % [m] Initial shoreline location
xb=xbo; % [m] Initial backbarrier location
W=xb-xs;% [m] Initial barrier width
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
bL=bLo; 
bm1=bm1o;
bm2=bm2o;
Lm=Lmo;
%% Computational parameters%%%%%%%%%%%%%%%
Tmax=94; %Runing time (years). After the barrier rolls over itself, the assumption of a constant 'zs' does not hold.
dt=0.1; % time step (years)   
t=0:dt:Tmax; 
n=length(t);
Xmax=500;
KO=xb+bm1+bL+bm2;
%% Variable storage %%%%%%%%%%%%%%%%%%%%%%%
BM1=zeros(1,n);
XS=zeros(1,n);
XB=zeros(1,n);
WW=zeros(1,n);
BM2=zeros(1,n);
BL=zeros(1,n);
QOWL=zeros(1,n);
QOWm=zeros(1,n);
QOW=zeros(1,n);
HT=zeros(1,n);
MMB=zeros(1,n);
MMBA=zeros(1,n);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Main code%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:n

%% OVERWASH FORMULATION 
Phi=min(1,bm1/bm1c); %relative accomodation width. How much goes on the marsh
EDm=zm-rng/2; %top of marsh
EDl=zL-rng/2; %lagoon
DD=Phi*EDm+EDl*(1-Phi);
Vd_B=max((We-W),0)*(H+DD);% Deficit Volume
% if Vd_B>Vd_max; break; end 
%% Waves %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
hb=zm+(zL-zm)*(1-exp(-dist*0.1/zL)); %scarp height according to profile (m)
%% Organic sediment thickness exposed at marsh-lagoon edge %%%%%%
%% Marsh Erosion Rate %%%%%%%%%%%%%%%%%%%%%%
g=9.8; % gravity (m/s^2)
Hs=3.63*10^-4*wind^1.23*bL^0.5; % significant wave height (m)
Tp=6.238*10^-2*(wind*bL)^(1/3); % period (seconds)
cg=g*Tp/4/pi; %group velocity 
WP=cg*9800/16*Hs^2;  % wave power (W/m)
Be=Ke*WP/(hb-zm); % Erosion rate (m/y)
%% Mean sea-level & shoreface depth
Z=Zo+zdot*t(i); % Assuming constant sea-level rise rate
%% Overwash formulation and State Equations %%%%%%%%%%%%%%%%%%%%%%%%%
Qow_B_1=Qow_max*Vd_B/Vd_max; % Backbarrier Overwash flux including organic sediments (m^2/y)
Qow=zdot*W+Qow_B_1; % Total Overwash flux (m^2/y)
if Qow_B_1==0; Qow=0; end %Implimenting the Hardened Shoreline senario
xsdot=Qow/(H+Dc);
Qow_B=Qow_B_1;% Backbarrier Overwash flux without organic sediments (m^2/y)
Qow_B_m=Qow_B*Phi;
Qow_B_l=Qow_B*(1-Phi);
v1=-Be+Ba+Qow_B_l/(zL-zm);
v2=-Be+Ba;
mmba=xb+bm1+bL;
mmb=xb+bm1+bL+bm2;
% (zdot*t(i))/B;
Lm=bm1+bm2;
bL=LB+(Z-Zo)/B-Lm-(xb-xbo);
%% Variable storage %%%%%%%%%%%%%%%%%%%%
XS(i)=xs;
XB(i)=xb;
WW(i)=W;
BM1(i)=bm1;
BM2(i)=bm2;
BL(i)=bL;
QOWL(i)=Qow_B_l;
QOWm(i)=Qow_B_m;
QOW(i)=Qow;
MMB(i)=mmb;
MMBA(i)=mmba;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
xbdot=Qow_B_m/(H+EDm);
bm1dot=v1-xbdot; 
bm2dot=v2+zdot/B;
%%% Absolute values %%%%%%%%%%%%%%%%%%%%%%%% 
xs=xs+xsdot*dt+Enet*dt;
% if xs>xbo; break; end
xb=xb+xbdot*dt;
W=xb-xs;
bm1=bm1+bm1dot*dt;
bm2=bm2+bm2dot*dt;
end
mid=1879-1840;%years
n_mid=round(mid/dt);
x1mid=42;x1end=135;
x2mid=399;x2end=467;
x3mid=590;x3end=626;
x4mid=4219;x4end=4272;
x5mid=6093;x5end=6199;

vectory1=[xso,x1mid,x1end]; %Shoreline Location
vectory2=[xbo,x2mid,x2end]; %Back Barrier Bay Shoreline 
vectory3=[xbo+bm1o,x3mid,x3end]; %Backbarrier Marsh-lagoon Edge
vectory4=[xbo+bm1o+bLo,x4mid,x4end]; %Mainland Marsh-lagoon Edge
vectory5=[xbo+bm1o+bLo+bm2o,x5mid,x5end]; %MM Mainland Edge
vectorx=[1840, 1879, 1934]; %years

Error_end=sqrt(((XS(n)-x1end)/x1end)^2+((XB(n)-x2end)/x2end)^2+(((BM1(n)+XB(n))-x3end)/x3end)^2+((MMBA(n)-x4end)/x4end)^2+((MMB(n)-x5end)/x5end)^2);
Error_mid=sqrt(((XS(n_mid)-x1end)/x1end)^2+((XB(n_mid)-x2end)/x2end)^2+(((BM1(n_mid)+XB(n_mid))-x3end)/x3end)^2+((MMBA(n_mid)-x4end)/x4end)^2+((MMB(n_mid)-x5end)/x5end)^2);
Error_total=Error_end+Error_mid;

figure(1)
hold on
subplot(3,2,3);
hold on
xlim([1840 1934]);
% ylim([550 650]);
plot(t+1840,XB+BM1,'k', 'linewidth',2)
plot(vectorx,vectory3,'ko','linewidth',2)
hold on
box on
xlabel('time (years)')
ylabel('x_3(m)')
title('Lagoon-Backbarrier Marsh Position')

subplot(3,2,6);
hold on
xlim([1840 1934]);
ylim([0 20]);
plot(t+1840,QOW,'k', 'linewidth',2)
box on
xlabel('time (years)')
ylabel('Q_{ow}(m^3/y)')
title('Overwash Flux')

subplot(3,2,1);
hold on
xlim([1840 1934]);
plot(t+1840,XS,'k', 'linewidth',2)
plot(vectorx,vectory1,'ko','linewidth',2)
hold on
box on
xlabel('time (years)')
ylabel('x_1(m)')
title('Ocean Shoreline Position')
legend('Model Output','Field Observation')

subplot(3,2,2);
hold on
xlim([1840 1934]);
% ylim([300 500]);
plot(t+1840,XB,'k', 'linewidth',2)
plot(vectorx,vectory2,'ko','linewidth',2)
hold on
box on
xlabel('time (years)')
ylabel('x_2(m)')
title('Backbarrier-marsh Interface Position')

subplot(3,2,4);
hold on
xlim([1840 1934]);
plot(t+1840,MMBA,'k', 'linewidth',2)
plot(vectorx,vectory4,'ko','linewidth',2)
hold on
box on
xlabel('time (years)')
ylabel('x_4(m)')
title('Inland Marsh-Lagoon Boundary Position')

subplot(3,2,5);
hold on
xlim([1840 1934]);
plot(t+1840,MMB,'k', 'linewidth',2)
plot(vectorx,vectory5,'ko','linewidth',2)
hold on
box on
xlabel('time (years)')
ylabel('x_5(m)')
title('Mainland-Inland Marsh Boundary Position')


