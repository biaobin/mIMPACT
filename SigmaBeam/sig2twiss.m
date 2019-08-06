function twiss = sig2twiss(SIG)
% According SIGMA-Beam matrix to calculate the twiss parameters
% All twiss para exclude dispersive contribution

% sig_u_beta, exlude dispersion contribution
for i=1:2
    for j=1:2
        sig(i,j)=SIG(i,j)-SIG(i,6)*SIG(j,6)/SIG(6,6);
    end
end

for i=3:4
    for j=3:4
        sig(i,j)=SIG(i,j)-SIG(i,6)*SIG(j,6)/SIG(6,6);
    end
end

% emittace without corrected, projected emittance
ex = sqrt( SIG(1,1)*SIG(2,2)-SIG(1,2)^2 );
ey = sqrt( SIG(3,3)*SIG(4,4)-SIG(3,4)^2 );
emx_y = [ex,ey];

% corrected emittace
ecx = sqrt( sig(1,1)*sig(2,2)-sig(1,2)^2 );
ecy = sqrt( sig(3,3)*sig(4,4)-sig(3,4)^2 );
emcx_y = [ecx,ecy];

% corrected beta function
beta  = [sig(1,1)/ecx, sig(3,3)/ecy];
alpha = [-sig(1,2)/ecx,-sig(3,4)/ecy];
gamma = [sig(2,2)/ecx, sig(4,4)/ecy];

% dispersion
etax = SIG(1,6)/SIG(6,6);
etaxp= SIG(2,6)/SIG(6,6);
etay = SIG(3,6)/SIG(6,6);
etayp= SIG(4,6)/SIG(6,6);
eta = [etax;etaxp;etay;etayp];

% NULL to make structure copy 
twiss.ElemIndex = [];
twiss.SPos      = [];

% projected emittance include dispersion
twiss.emx_y = emx_y;
% projected emittance exclude dispersion
twiss.emcx_y = emcx_y;

twiss.beta      = beta;
twiss.alpha     = alpha;
twiss.gamma     = gamma;
twiss.eta= eta;
% twiss.sig_z     = sqrt(SIG(5,5));
% twiss.sig_delta     = sqrt(SIG(6,6));
twiss.SIG       = SIG;

%sig value excluded dispersion
%4*4 now, not include (z,delta)'s coupling
sig(5,5) = sqrt(SIG(5,5));
sig(6,6) = sqrt(SIG(6,6));
twiss.sig = sig;

end












