function TW = gettwiss(Line,twiss_in)
% get twiss and dispersion function along the lattice
global E_central

% get the concatenated matrix at every step
[M66,ConcaM66]=getm66(Line);

% initial sig-beam matrix
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
etay_0    = twiss_in.Dispersion(3);
etayp_0   = twiss_in.Dispersion(4);

% sigma beam matrix
sig66_0 = twiss_in.delta^2;
sig55_0 = twiss_in.sig_z^2;

sig11_0 = ecx_0 * betax_0 + sig66_0 * etax_0^2;
sig22_0 = ecx_0 * gamax_0 + sig66_0 * etaxp_0^2;
sig12_0 = -ecx_0 * alphax_0 + sig66_0 * etax_0*etaxp_0;
sig21_0 = sig12_0;

sig16_0 = etax_0 * sig66_0;
sig26_0 = etaxp_0 * sig66_0;
sig61_0 = sig16_0;
sig62_0 = sig26_0;

sig33_0 = ecy_0 * betay_0 + sig66_0 * etay_0^2;
sig44_0 = ecy_0 * gamay_0 + sig66_0 * etayp_0^2;
sig34_0 = -ecy_0 * alphay_0 + sig66_0 * etay_0*etayp_0;
sig43_0 = sig34_0;

sig36_0 = etay_0 * sig66_0;
sig46_0 = etayp_0 * sig66_0;
sig63_0 = sig36_0;
sig64_0 = sig46_0;

% 2019-03-05, add some comments 
% here, we used the normal case,
% sig_15 = sig_25 = sig_51 = sig_52 = 0
% sig_56 = sig_65 = 0
% when, beam tilt, sig_15, sig_25 are not 0
% when, beam chirp, sig_56, sig_65 are not 0

SIG0 = [sig11_0 sig12_0   0 0     0 sig16_0;
        sig21_0 sig22_0   0 0     0 sig26_0;
        0       0 sig33_0 sig34_0 0 sig36_0;
        0       0 sig43_0 sig44_0 0 sig46_0;
        0       0 0       0       sig55_0 0;
        sig61_0 sig62_0 sig63_0 sig64_0 0 sig66_0];

NE = length(Line);
SIG1(:,:,1) = SIG0;    % length is NE+1, included initial twiss para


% 必须完全相同的结构体才能相互赋值
TD(1) = sig2twiss(SIG0);
TD(1).ElemIndex = twiss_in.ElemIndex;
TD(1).SPos = twiss_in.SPos; 

for j=1:NE
    SIG1(:,:,j+1) = ConcaM66(:,:,j) * SIG0 * ConcaM66(:,:,j)';
    % call sig2twiss.m function to calculate the twiss para from SIG matrix
    TD(j+1) = sig2twiss(SIG1(:,:,j+1));
    % modify ElemIndex and Spos   
    TD(j+1).ElemIndex = TD(j).ElemIndex + 1;
    TD(j+1).SPos = TD(j).SPos + Line{j}.Length;    
end


% 2019-3-01, change outputing TW, data in normal N*1 format, easy for ploting
%total sig value
tmp.SIG  = cat(3,TD.SIG);
%sig excluded dispersion contribution
tmp.sig  = cat(3,TD.sig);

%emittance include dispersion
tmp.emx_y = cat(1,TD.emx_y);

%emittance exclude dispersion
tmp.emcx_y = cat(1,TD.emcx_y);

tmp.beta = cat(1,TD.beta);
tmp.alpha = cat(1,TD.alpha);
tmp.gamma = cat(1,TD.gamma);

tmp.eta  = reshape(cat(1,TD.eta),[4,length(Line)+1]);
tmp.eta = tmp.eta';
% output TW 
% ------------------------
TW.betax = tmp.beta(:,1);
TW.betay = tmp.beta(:,2);
TW.alphax = tmp.alpha(:,1);
TW.alphay = tmp.alpha(:,2);
TW.gammax = tmp.gamma(:,1);
TW.gammay = tmp.gamma(:,2);

TW.etax  = tmp.eta(:,1);
TW.etaxp = tmp.eta(:,2);
TW.etay  = tmp.eta(:,3);
TW.etayp = tmp.eta(:,4);

TW.s    = cat(1,TD.SPos);  % Longitudinal direction combine the matrix

TW.ex = tmp.emx_y(:,1);
TW.ey = tmp.emx_y(:,2);

TW.exn = tmp.emx_y(:,1) .* e2gamma(E_central'/1e6);
TW.eyn = tmp.emx_y(:,2) .* e2gamma(E_central'/1e6);

% emittance exclude dispersion
TW.ecx = tmp.emcx_y(:,1);
TW.ecy = tmp.emcx_y(:,2);

TW.ecxn = tmp.emcx_y(:,1) .* e2gamma(E_central'/1e6);
TW.ecyn = tmp.emcx_y(:,2) .* e2gamma(E_central'/1e6);

% beam RMS value included dispersion, i.e. total RMS value
TW.sigx = reshape(sqrt(tmp.SIG(1,1,:)),[length(Line)+1,1]);
TW.sigy = reshape(sqrt(tmp.SIG(3,3,:)),[length(Line)+1,1]);
TW.sigz = reshape(sqrt(tmp.SIG(5,5,:)),[length(Line)+1,1]);

TW.sigxp = reshape(sqrt(tmp.SIG(2,2,:)),[length(Line)+1,1]);
TW.sigyp = reshape(sqrt(tmp.SIG(4,4,:)),[length(Line)+1,1]);
TW.sig_delta = reshape(sqrt(tmp.SIG(6,6,:)),[length(Line)+1,1]);

% sig_beta excluded dispersion
TW.sigx_beta = reshape(sqrt(tmp.sig(1,1,:)),[length(Line)+1,1]);
TW.sigy_beta = reshape(sqrt(tmp.sig(3,3,:)),[length(Line)+1,1]);

TW.sigxp_beta = reshape(sqrt(tmp.sig(2,2,:)),[length(Line)+1,1]);
TW.sigyp_beta = reshape(sqrt(tmp.sig(3,3,:)),[length(Line)+1,1]);

end





