function TD = beamtwiss(Line,twiss_in,N)
% Beam twiss at every step

BeamDis = trackingpass(Line,twiss_in,N);

NE = length(Line);

for j=1:NE+1
    x0 = BeamDis(:,1,j); xp0 = BeamDis(:,2,j);
    y0 = BeamDis(:,3,j); yp0 = BeamDis(:,4,j);    
    z0 = BeamDis(:,5,j); delta0 = BeamDis(:,6,j);    
    
    SIG_11 = mean(  (x0-mean(x0)).*(x0-mean(x0))   );
    SIG_12 = mean(  (x0-mean(x0)).*(xp0-mean(xp0))  );
    SIG_21 = SIG_12;
    SIG_22 = mean(  (xp0-mean(xp0)).*(xp0-mean(xp0)) );

    SIG_33 = mean(  (y0-mean(y0)).*(y0-mean(y0))   );
    SIG_34 = mean(  (y0-mean(y0)).*(yp0-mean(yp0)) );
    SIG_43 = SIG_34;
    SIG_44 = mean(  (yp0-mean(yp0)).*(yp0-mean(yp0))   );
    
    SIG_15 = mean(  (x0-mean(x0)).*(z0-mean(z0))   );
    SIG_51 = SIG_15;
    SIG_25 = mean(  (xp0-mean(xp0)).*(z0-mean(z0))   );
    SIG_52 = SIG_25;
    
    SIG_16 = mean(  (x0-mean(x0)).*(delta0-mean(delta0))   );
    SIG_61 = SIG_16;
    SIG_36 = mean(  (y0-mean(y0)).*(delta0-mean(delta0))   );
    SIG_63 = SIG_36;

    SIG_26 = mean(  (xp0-mean(xp0)).*(delta0-mean(delta0))   );
    SIG_62 = SIG_26;
    SIG_46 = mean(  (yp0-mean(yp0)).*(delta0-mean(delta0))   );
    SIG_64 = SIG_46;
    
    SIG_55 = mean(  (z0-mean(z0)).*(z0-mean(z0))   );
    SIG_66 = mean(  (delta0-mean(delta0)).*(delta0-mean(delta0))   );
    SIG_56 = mean(  (z0-mean(z0)).*(delta0-mean(delta0))   );
    SIG_65 = SIG_56;
        
    SIG    =   [SIG_11 SIG_12   0       0     SIG_15 SIG_16;
                0      SIG_22   0       0     SIG_25 SIG_26;
                0       0       SIG_33 SIG_34 0      SIG_36;
                0       0       0      SIG_44 0      SIG_46;
                SIG_51 SIG_52   0       0     SIG_55 SIG_56;
                SIG_61 SIG_62 SIG_63 SIG_64 SIG_65 SIG_66];
    
    TD(j) = sig2twiss(SIG);
     
end

TD(1).ElemIndex = twiss_in.ElemIndex;
TD(1).SPos = twiss_in.SPos; 

for j=1:NE
    
    TD(j+1).ElemIndex = TD(j).ElemIndex + 1;
    TD(j+1).SPos = TD(j).SPos + Line{j}.Length; 
end

end


