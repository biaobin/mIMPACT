classdef const
    properties (Constant)  
        
        % speed of light
        c_mks = 2.997924580000000e+08;
        
        % parameters for Ji's code
        mev_impact  = 0.511001; 
        mev = const.mev_impact;
        
        % Alfven current
        IA = const.mev_impact*1E6 * 4*pi /const.Z0;
               
        epsilon0 = 8.854187817d-12;
        mu0 = 1/const.c_mks^2/const.epsilon0;
        
        % impedance in vacuum
%       Z0 = 120 * pi;
        Z0 = sqrt(const.mu0/const.epsilon0);
             
        % mev for elegant 
        mev_elegant = 0.510999060000000
        
    end

end