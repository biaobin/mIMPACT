function M = Mq(L,K,beta)
% L = L/2;


% Quadrupole transfer matrix

% Mq(L)    give drift matrix in beta =1
% Mq(L,K)    gives pure quadrupole matrix in beta =1   
    
if nargin < 3 | beta ==1
    gamma = Inf;           % 默认极端相对论
else
    gamma = 1/sqrt(1-beta^2);
end

if K == 0
%%% 漂移段
M = [ 1              L      0              0           0       0;
      0              1      0              0           0       0;
      0              0      1              L           0       0;
      0              0      0              1           0       0;
      0              0      0              0           1       L/gamma^2;
      0              0      0              0           0       1];  
  return
end
    
%%%  四极铁
    phi = sqrt(K)*L;
    M =[cos(phi)           sin(phi)/sqrt(K) 0                   0                   0     0;  
        -sqrt(K)*sin(phi)   cos(phi)         0                   0                   0     0;    
         0                  0                cosh(phi)           sinh(phi)/sqrt(K)   0     0;
         0                  0                sqrt(K)*sinh(phi)   cosh(phi)           0     0;
         0                  0                0                   0                   1     L/gamma^2;
         0                  0                0                   0                   0     1];
end