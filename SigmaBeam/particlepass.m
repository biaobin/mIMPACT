function out = particlepass (Line,X0)
%biaobin,2018-11-15, for tracking given particle distribution rather
%                    than given twiss-parameters

% X0 = [x1 xp1 y1 yp1 z1 delta1;
%       x2 xp2 y2 yp2 z2 delta2;
%       .....];  % 初始粒子六维分布


% get the concatenated matrix at every step
[M66,ConcaM66]=getm66(Line);

% get envery step particle distribution
% =====================================
% NE = length(Line);
% 
% FinaBeam(:,:,1) = X0;
% temp = [];
% for i=1:NE 
%     for j=1:size(X0,1)
%         
%         temp =  ConcaM66(:,:,i) * X0(j,:)';
%         FinaBeam(j,:,i+1) = temp';
%     end
% end
% ======================================
% tmp = M66;
% % 
% M66 = eye(6,6);
% M66(1,6) = tmp(1,6);
% M66(2,6) = tmp(2,6);
% % M66(6,5) = tmp(6,5);


% change to only get final beam
    temp = [];
    for j=1:size(X0,1)        
        temp =  M66 * X0(j,:)';
        FinaBeam(j,:) = temp';
    end

out = FinaBeam;

end
