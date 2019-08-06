function M = Mb(Lb,thetaB,E1,E2,beta)
% Rectangular dipole transfer matrix
% 
% Input parameters:
% thetaB   总弯转角 [rad]
% E1       入射角 [rad]
% E2       出射角 [rad]
% beta     粒子速度
% L        arc length of the dipole, rho = L/thetaB
% rho      弯转半径
%
% Usage:
% Mrect(rho,thetaB,0,0)     gives pure sector bend
% Mrect(rho,thetaB,E1,E2)   gives rectangle bend
rho = Lb/thetaB;

if nargin<5
    beta =1;           % 默认作为极端相对论情况
end

%%% Sector Bend
Mb = [cos(thetaB)         rho*sin(thetaB)       0      0       0     rho*(1-cos(thetaB));
      -sin(thetaB)/rho    cos(thetaB)           0      0       0     sin(thetaB);
      0              0                1      rho*thetaB   0     0;
      0              0                0      1       0     0;
     -sin(thetaB)        -rho*(1-cos(thetaB))   0      0       1     rho*(sin(thetaB)-beta^2 *thetaB);
      0              0                0      0       0     1];


%%% 矩形弯铁的边缘场 
Ms1 = [1             0      0              0           0       0;
      tan(E1)/rho    1      0              0           0       0;
      0              0      1              0           0       0;
      0              0     -tan(E1)/rho    1           0       0;
      0              0      0              0           1       0;
      0              0      0              0           0       1];
  
Ms2 = [1             0      0              0           0       0;
      tan(E2)/rho    1      0              0           0       0;
      0              0      1              0           0       0;
      0              0     -tan(E2)/rho    1           0       0;
      0              0      0              0           1       0;
      0              0      0              0           0       1];
% 矩形铁传输矩阵
 M = Ms2 * Mb * Ms1;
end