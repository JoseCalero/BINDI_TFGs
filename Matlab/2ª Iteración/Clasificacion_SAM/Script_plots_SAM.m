%WRIST

%baseline

baseline = find(label==1) ;

time_baseline = (1/700)*(baseline(end) - baseline(1)) ;

baseline_wrist_EDA = signal.wrist.EDA (round(baseline(1)*(4/700)) : round (baseline(end)*(4/700)));



%stress
stress = find (label==2) ;

time_stress = (1/700)*(stress(end) - stress(1)) ;

stress_wrist_EDA = signal.wrist.EDA (round(stress(1)*(4/700)) : round (stress(end)*(4/700))) ;



%meditation
meditation = find (label==4) ;
N = 1 ;
M = 1 ;

for n = 1 : length (meditation)
    
    if (meditation(n) <= 2016000)
        meditation1(N) = meditation(n) ;
        N = N+1 ;
    end
    
    if (meditation(n) >= 3681000)
        meditation2(M) = meditation(n) ;
        M = M+1 ;
    end
end
        
time_meditation = (1/700)*(meditation(end) - meditation(1)) ;

meditation1_wrist_EDA = signal.wrist.EDA (round(meditation1(1)*(4/700)) : round (meditation1(end)*(4/700))) ;
meditation2_wrist_EDA = signal.wrist.EDA (round(meditation2(1)*(4/700)) : round (meditation2(end)*(4/700))) ;


%amusement
amusement = find (label==3) ;

time_amusement = (1/700)*(amusement(end) - amusement(1)) ;

amusement_wrist_EDA = signal.wrist.EDA (round(amusement(1)*(4/700)) : round (amusement(end)*(4/700))) ;

figure (1)

subplot (3,1,1),

hold on 

plot (round(baseline(1)*(4/700)):(round(baseline(end)*(4/700))), baseline_wrist_EDA, 'black','DisplayName', 'HVLA') ;

plot (round(stress(1)*(4/700)):round(stress(end)*(4/700)), stress_wrist_EDA, 'color','[0.8500 0.3250 0.0980]', 'DisplayName', 'LVHA') ;

plot (round(meditation1(1)*(4/700)):round(meditation1(end)*(4/700)), meditation1_wrist_EDA,'black','DisplayName', 'HVLA') ;

plot (round(meditation2(1)*(4/700)):round(meditation2(end)*(4/700)), meditation2_wrist_EDA,'black','DisplayName', 'HVLA') ;

plot (round(amusement(1)*(4/700)):round(amusement(end)*(4/700)), amusement_wrist_EDA, 'color','[0.5 0.5 0.5]','DisplayName', 'MVLA') ; 

lgd = legend ;

lgd.NumColumns = 2 ;

subplot (3,1,2), plot (signal.wrist.EDA) ;

subplot (3,1,3), plot (label) ;

hold off