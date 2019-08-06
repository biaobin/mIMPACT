function beta=e2beta(energy)
%biaobin,2018-11-15, change energy[MeV] to beta
% energy = 100;  %kinetic + 0.511001 [MeV]

gamma = energy/const.mev; 

beta  = sqrt(1-1/gamma.^2);

end
