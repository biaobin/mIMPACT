function X = impactz2geophase(X0,E0)
%biaobin,2018-11-22, transform impactz phase to geophase
%X0, 6D phase in Impactz, N*6 matrix
%E0, reference energy in [MeV]

Scxl = 1;

% reference particle
gam0    = e2gamma(E0);
bet0    = e2beta(E0);
gambet0 = e2p(E0);

% other particles
gam = gam0 - X0(:,6);
gambetz = sqrt(gam.^2-1 -X0(:,2).^2 -X0(:,4).^2);
gambet = sqrt(gam.^2 - 1);

% geo phase
tmp1 = X0(:,1) *Scxl;
tmp2 = X0(:,2) ./gambetz;
tmp3 = X0(:,3) * Scxl;
tmp4 = X0(:,4) ./gambetz;
tmp5 = -X0(:,5)*bet0*Scxl;
tmp6 = (gambet-gambet0)/gambet0;

X = [tmp1 tmp2 tmp3 tmp4 tmp5 tmp6];

end