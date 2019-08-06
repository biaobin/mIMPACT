function M = Mac(Length,Voltage,Phase,Freq,E0)
% cavity transfer matrix with end focus effects

%biaobin, 2018-10-26, add r56 in cavity

% input parameters:
% 
% Length, cavity length
% Upeak, Upeak volatage [V/m]
% Phase, cavity phase, sin(90) refer to peak acceleration, unit [degree]
% U0, initial beam energy U0, unit [MeV/e]
% freq, frequency of RF field

c = const.c_mks;
phi = Phase/180 * pi; % convert degree to rad

deltaE = Voltage * sin(phi);
E1 = E0 + deltaE;

% ==================
gamma0= e2gamma(E0/1E6);
beta0 = e2beta(E0/1E6);

gamma1= e2gamma(E1/1E6);
beta1 = e2beta(E1/1E6);

% chirp
L = Length;
% h = -deltaE*cot(phi)*(2*pi*Freq/c)/E1;  % minus is from the convention in our code

%biaobin,2018-11-18, over beta1^2, phase->dz transform 
h = -deltaE*cot(phi)*(2*pi*Freq/c)/(E1*beta1^2);  % minus is from the convention in our code

% for r56 calculation
A = (gamma1-gamma0)/L;
r56 = (1/gamma0 - 1/gamma1)/A;

% % ImpactZ edition
Macmid = [
    1       L*(beta0*gamma0)/(gamma1-gamma0)*log((beta1*gamma1)/(beta0*gamma0))  0  0  0    0;
    0       (beta0*gamma0)/(beta1*gamma1)                             0  0  0    0;
    0       0                                       1  L*(beta0*gamma0)/(gamma1-gamma0)*log((beta1*gamma1)/(beta0*gamma0))  0    0;
    0       0                                       0  (beta0*gamma0)/(beta1*gamma1)  0    0;
    0       0                                       0  0  1    0;
    0       0                                       0  0  h    (beta0*gamma0)/(beta1*gamma1)];

% elegant version
% Macmid = [
%     1       L*(beta0*gamma0)/(beta1*gamma1-beta0*gamma0)*log((beta1*gamma1)/(beta0*gamma0))  0  0  0    0;
%     0       (beta0*gamma0)/(beta1*gamma1)                             0  0  0    0;
%     0       0                                       1  L*(beta0*gamma0)/(gamma1-gamma0)*log((beta1*gamma1)/(beta0*gamma0))  0    0;
%     0       0                                       0  (beta0*gamma0)/(beta1*gamma1)  0    0;
%     0       0                                       0  0  1    0;
%     0       0                                       0  0  h    (beta0*gamma0)/(beta1*gamma1)];


% % matrix, initial edition
% Macmid = [
%     1       L*gamma1/(gamma2-gamma1)*log(gamma2/gamma1)  0  0  0    0;
%     0       gamma1/gamma2                             0  0  0    0;
%     0       0                                       1  L*gamma1/(gamma2-gamma1)*log(gamma2/gamma1)  0    0;
%     0       0                                       0  gamma1/gamma2  0    0;
%     0       0                                       0  0  1    0;
%     0       0                                       0  0  h    gamma1/gamma2];


Macin = [
    1  0   0    0  0  0;
    -(gamma1-gamma0)/(2*gamma0*L) 1   0  0  0  0;
    0       0                                       1  0  0    0;
    0       0                                       -(gamma1-gamma0)/(2*gamma0*L)  1  0    0;
    0  0  0  0  1    0;
    0  0  0  0  0    1];

Macout = [
    1  0   0    0   0   0;
    (gamma1-gamma0)/(2*gamma1*L) 1   0    0    0     0;
    0       0                                       1  0  0    0;
    0       0                                      (gamma1-gamma0)/(2*gamma1*L)  1  0    0;
    0  0  0  0  1    0;
    0  0  0  0  0    1];

M = Macout * Macmid * Macin;

end