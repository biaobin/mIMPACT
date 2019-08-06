function p=e2p(energy)
% energy = 100;  %total energy, i.e. kinetic + 0.511001 [MeV]

% gamma = energy/const.mev_impact; 
gamma = energy/const.mev; 

beta  = sqrt(1-1/gamma.^2);

p = beta*gamma;  %normalized momentum

% fprintf('beta=%12.10e [1], gamma=%12.10e [1], p=%12.10e [1] \n',beta,gamma,p);

end

