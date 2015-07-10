close all
clear all
clc

%dT = 11 ; % assume dT = dTinner = dTouter
Q1 = (0.5*1000)/60; % flow in cc/sec
Q = Q1 * (1e-02)^3; % flow in m3/sec

P = 840 %pressure in mbarr
P = P * 1e2; % pressure in Pa (N/m2)

B1 = 877;
B2 = 1.3;
B3 = 3.75e-4;
B4 = 1.27e-5;
B5 = 2.24e-5;

T1 = 23.5 + 273;
Tc = T1;
dT = 11;
Th = T1 + dT;
T_prime = (Th + Tc)/2;


C11 = B1*dT*Q*P
C21 = (T_prime - (B2*dT*Q*P)/(T_prime*(B3+B4*T_prime)))^2
C41 = 1/(T_prime*(B3+B4*T_prime))
C51 = 1/(B5*T_prime^1.94)

S1 = ((C11/C21)*(C41 - C51))*100

%% checking you can ignore this section
close all
clear all
clc

Q1 = (0.5.*1000)./60; % flow in cc/sec I'm assuming flow is 0.5 lpm
Q = Q1 * (1e-02).^3; % flow in m3/sec

P = 840 %pressure in mbarr
P = P * 1e2; % pressure in Pa (N/m2)

B1 = 877;
B2 = 1.3;
B3 = 3.75e-4;
B4 = 1.27e-5;
B5 = 2.24e-5;

T1 = 23.5 + 273;
%T1 = 26.81+273
Tc = T1;
dT = 11;%  303.406-299.81
Th = T1 + dT;
T_prime = (Th + Tc)./2;

dTQP = dT.*Q.*P;
TBBT = (T_prime.*(B3+B4.*T_prime));
C1 = B1.*dTQP
C2 = (T_prime - B2.*dTQP./TBBT).^2 
C1./C2

C3a = 1./TBBT;
C3b = 1./(B5.*T_prime.^1.94);
C3 = (C3a - C3b);
S_lance = (C1./C2).*(C3);
S_lance_prct = S_lance.*100