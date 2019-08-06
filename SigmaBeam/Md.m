function M = Md(L,beta)
% drift line transfer matrix

if nargin<2 | beta ==1
    gamma = Inf;
else
    gamma = 1/sqrt(1-beta^2); 
end

M = [ 1              L      0              0           0       0;
      0              1      0              0           0       0;
      0              0      1              L           0       0;
      0              0      0              1           0       0;
      0              0      0              0           1       L/gamma^2;
      0              0      0              0           0       1];  
end