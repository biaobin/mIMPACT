function X = geophase2impactz(X0,E0)
%biaobin,2018-11-23, transform geo phase to impactz
%X0, 6D phase in geo phase
%E0, reference energy in [MeV]

Scxl = 1;

% reference particle
gam0    = e2gamma(E0);
bet0    = e2beta(E0);
gambet0 = e2p(E0);

% other particles
gambet = (X0(:,6)+1)*gambet0;
gambetz = gambet ./sqrt(X0(:,2).^2 +X0(:,4).^2 +1);
gam = sqrt(gambet.^2 +1)

% ImpactZ phase
tmp1 = X0(:,1) /Scxl;
tmp2 = X0(:,2) .*gambetz;
tmp3 = X0(:,3) /Scxl;
tmp4 = X0(:,4) .*gambetz;
tmp5 = -X0(:,5)/bet0/Scxl;
tmp6 = gam0-gam;

X = [tmp1 tmp2 tmp3 tmp4 tmp5 tmp6];

end