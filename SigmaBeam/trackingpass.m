function out = trackingpass (Line,twiss_in,N)
% Created at Feb./14/2018

% Tracking particles through first-order matrix
% No Coupling Initial Distribution
% Usage:
% N: particles number

% IniBeam is (x x' y y' z delta; ....)
% twiss2sig.m
ecx_0 = twiss_in.Emittance(1);   % corrected emittance exclude dispersion
                                 % contribution
ecy_0    = twiss_in.Emittance(2);
betax_0  = twiss_in.beta(1);
betay_0  = twiss_in.beta(2);
alphax_0 = twiss_in.alpha(1);
alphay_0 = twiss_in.alpha(2);
gamax_0  = (1 + alphax_0^2)/betax_0;
gamay_0  = (1 + alphay_0^2)/betay_0;
etax_0   = twiss_in.Dispersion(1);
etaxp_0   = twiss_in.Dispersion(2);
etay_0   = twiss_in.Dispersion(3);
etayp_0   = twiss_in.Dispersion(4);

% sigma beam matrix
sig66_0 = twiss_in.delta^2;
sig55_0 = twiss_in.sig_z^2;

sig11_0 = ecx_0 * betax_0 + sig66_0 * etax_0^2;
sig22_0 = ecx_0 * gamax_0 + sig66_0 * etaxp_0^2;

sig33_0 = ecy_0 * betay_0 + sig66_0 * etay_0^2;
sig44_0 = ecy_0 * gamay_0 + sig66_0 * etayp_0^2;

sig_x = sqrt(sig11_0);
sig_y = sqrt(sig33_0);
sig_z = sqrt(sig55_0);

sig_xp =  sqrt(sig22_0);
sig_yp =  sqrt(sig44_0);
sig_delta = sqrt(sig66_0);

x0 = randn(N,1) * sig_x;
y0 = randn(N,1) * sig_y;
s0 = randn(N,1) * sig_z;

xp0 = randn(N,1) * sig_xp;
yp0 = randn(N,1) * sig_yp;
eta0 = sig_delta * randn(N,1);

IniBeam = [x0 xp0 y0 yp0 s0 eta0];  % 初始粒子六维分布


% get the concatenated matrix at every step
[M66,ConcaM66]=getm66(Line);

NE = length(Line);

FinaBeam(:,:,1) = IniBeam;
temp = [];
for i=1:NE 
    for j=1:N
        
        temp =  ConcaM66(:,:,i) * IniBeam(j,:)';
        FinaBeam(j,:,i+1) = temp';
    end
end

out = FinaBeam;

end
