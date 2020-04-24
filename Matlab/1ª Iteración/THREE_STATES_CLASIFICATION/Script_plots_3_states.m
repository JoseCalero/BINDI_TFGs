%WRIST

%baseline

baseline = find(label==1) ;

%baseline = label ( :, 1 ) ; 

time_baseline = (1/700)*(baseline(end) - baseline(1)) ;

baseline_wrist_EDA = signal.wrist.EDA (round(baseline(1)*(4/700)) : round (baseline(end)*(4/700)));



%stress
stress = find (label==2) ;

time_stress = (1/700)*(stress(end) - stress(1)) ;

stress_wrist_EDA = signal.wrist.EDA (round(stress(1)*(4/700)) : round (stress(end)*(4/700))) ;



%meditation
%meditation = find (label==4) ;

%time_meditation = (1/700)*(meditation(end) - meditation(1)) ;

%meditation_wrist_EDA = signal.wrist.EDA (round(meditation(1)*(4/700)) : round (meditation(end)*(4/700))) ;



%amusement
amusement = find (label==3) ;

time_amusement = (1/700)*(amusement(end) - amusement(1)) ;

amusement_wrist_EDA = signal.wrist.EDA (round(amusement(1)*(4/700)) : round (amusement(end)*(4/700))) ;


hold on

%S2
%x_b = linspace ((4/700)*214600, (4/700)*1015000, 4577) ;
%x_s = linspace ((4/700)*1591000, (4/700)*2022000, 2461) ;
%x_a = linspace ((4/700)*3334000, (4/700)*3588000, 1449) ;

%S3
%x_b = linspace ((4/700)*247000, (4/700)*1045000, 4561) ;
%x_s = linspace ((4/700)*1570999, (4/700)*2019000, 2561) ;
%x_a = linspace ((4/700)*3503000, (4/700)*3765000, 1501) ;

%S4
%x_b = linspace ((4/700)*199700, (4/700)*1010000, 4633) ;
%x_s = linspace ((4/700)*2529000, (4/700)*2974000, 2541) ;
%x_a = linspace ((4/700)*1283000, (4/700)*1543000, 1489) ;

%S5
%x_b = linspace ((4/700)*195600, (4/700)*1034000, 4793) ;
%x_s = linspace ((4/700)*2522000, (4/700)*2973000, 2581) ;
%x_a = linspace ((4/700)*1304000, (4/700)*1565000, 1497) ;

%S6
%x_b = linspace ((4/700)*449900, (4/700)*1276000, 4721) ;
%x_s = linspace ((4/700)*1708000, (4/700)*2163000, 2601) ;
%x_a = linspace ((4/700)*3885000, (4/700)*4146000, 1489) ;

%S7
%x_b = linspace ((4/700)*70440, (4/700)*900600, 4745) ;
%x_s = linspace ((4/700)*2168000, (4/700)*2616000, 2561) ;
%x_a = linspace ((4/700)*1085000, (4/700)*1346000, 1489) ;

%S8--------------
%x_b = linspace ((4/700)*247000, (4/700)*1045000, 4561) ;
%x_s = linspace ((4/700)*1570999, (4/700)*2019000, 2561) ;
%x_a = linspace ((4/700)*3503000, (4/700)*3765000, 1501) ;

%S9
%x_b = linspace ((4/700)*247000, (4/700)*1045000, 4561) ;
%x_s = linspace ((4/700)*1570999, (4/700)*2019000, 2561) ;
%x_a = linspace ((4/700)*3503000, (4/700)*3765000, 1501) ;

%S10
%x_b = linspace ((4/700)*247000, (4/700)*1045000, 4561) ;
%x_s = linspace ((4/700)*1570999, (4/700)*2019000, 2561) ;
%x_a = linspace ((4/700)*3503000, (4/700)*3765000, 1501) ;

%S11
%x_b = linspace ((4/700)*247000, (4/700)*1045000, 4561) ;
%x_s = linspace ((4/700)*1570999, (4/700)*2019000, 2561) ;
%x_a = linspace ((4/700)*3503000, (4/700)*3765000, 1501) ;

%S13
%x_b = linspace ((4/700)*247000, (4/700)*1045000, 4561) ;
%x_s = linspace ((4/700)*1570999, (4/700)*2019000, 2561) ;
%x_a = linspace ((4/700)*3503000, (4/700)*3765000, 1501) ;

%S14
%x_b = linspace ((4/700)*247000, (4/700)*1045000, 4561) ;
%x_s = linspace ((4/700)*1570999, (4/700)*2019000, 2561) ;
%x_a = linspace ((4/700)*3503000, (4/700)*3765000, 1501) ;

%S14
%x_b = linspace ((4/700)*247000, (4/700)*1045000, 4561) ;
%x_s = linspace ((4/700)*1570999, (4/700)*2019000, 2561) ;
%x_a = linspace ((4/700)*3503000, (4/700)*3765000, 1501) ;

%S15
%x_b = linspace ((4/700)*247000, (4/700)*1045000, 4561) ;
%x_s = linspace ((4/700)*1570999, (4/700)*2019000, 2561) ;
%x_a = linspace ((4/700)*3503000, (4/700)*3765000, 1501) ;

%S16
%x_b = linspace ((4/700)*247000, (4/700)*1045000, 4561) ;
%x_s = linspace ((4/700)*1570999, (4/700)*2019000, 2561) ;
%x_a = linspace ((4/700)*3503000, (4/700)*3765000, 1501) ;

%S17
%x_b = linspace ((4/700)*247000, (4/700)*1045000, 4561) ;
%x_s = linspace ((4/700)*1570999, (4/700)*2019000, 2561) ;
%x_a = linspace ((4/700)*3503000, (4/700)*3765000, 1501) ;

plot (x_b, baseline_wrist_EDA, 'black') ;


plot (x_s, stress_wrist_EDA, 'red') ;

%plot (meditation_wrist_EDA, 'cyan') ;


plot (x_a , amusement_wrist_EDA, 'magenta') 

grid



















%CHEST

%baseline

baseline_C = find(label==1) ;

%baseline = label ( :, 1 ) ; 

time_baseline_C = (1/700)*(baseline_C(end) - baseline_C(1)) ;

baseline_chest_EDA = signal.chest.EDA (round(baseline_C(1)*(4/700)) : round (baseline_C(end)*(4/700)));



%stress
stress_C = find (label==2) ;

time_stress_C = (1/700)*(stress_C(end) - stress_C(1)) ;

stress_chest_EDA = signal.chest.EDA (round(stress_C(1)*(4/700)) : round (stress_C(end)*(4/700))) ;



%meditation
meditation_C = find (label==4) ;

time_meditation_C = (1/700)*(meditation_C(end) - meditation_C(1)) ;

meditation_chest_EDA = signal.chest.EDA (round(meditation_C(1)*(4/700)) : round (meditation_C(end)*(4/700))) ;



%amusement
amusement_C = find (label==3) ;

time_amusement_C = (1/700)*(amusement_C(end) - amusement_C(1)) ;

amusement_chest_EDA = signal.chest.EDA (round(amusement_C(1)*(4/700)) : round (amusement_C(end)*(4/700))) ;


%hold on

%plot (baseline_chest_EDA, 'black') ;

%plot (stress_chest_EDA, 'red') ;

%plot (meditation_chest_EDA, 'cyan') ;

%plot (amusement_chest_EDA, 'magenta') 

%grid

