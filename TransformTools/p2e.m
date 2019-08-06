function [E,gamma,beta]=p2e(p)
%2018-10, biaobin, change uniformed momentum to energy in [MeV]

beta  = p./sqrt(p.^2+1);
gamma = p./beta;
E = gamma * const.mev_elegant;

%fprintf('beta=%12.10e [1], E=%12.10e [MeV] \n',beta,E);

end





