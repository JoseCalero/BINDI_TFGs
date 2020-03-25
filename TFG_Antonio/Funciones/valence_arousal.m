%% RE-ETIQUETADO DE LABEL
%
%

function [VA_, baseline, stress, medi1, amusement, medi2] = valence_arousal(label, valence, arousal)

baseline = find(label==1);
stress = find(label==2);
amusement = find(label==3);
meditation = find(label==4);

n = 1;
N = 1;
while (meditation(n+1) - meditation(n) == 1)
    medi1(N) = meditation(n);
    N = N + 1;
    n = n + 1;
end
medi1(N) = meditation(n);

n = n + 1;
N = 1;
while (meditation(n+1) - meditation(n) == 1 && n+1 < length(meditation))
    medi2(N) = meditation(n);
    N = N + 1;
    n = n + 1;
end

%% Self-reports: HVHA | HVMA | HVLA | MVHA | MVMA | MVLA | LVHA | LVMA | LVLA 
%
%

for n = 1:5
    if (valence(n)>=7 && arousal(n)>=7)
        VA(n) = 1; %1er cuadrante - HVHA
    end

    if (4<=valence(n) && valence(n)<=6 && arousal(n)>=7)
        VA(n) = 2; %2o cuadrante - MVHA
    end
    
    if (valence(n)<=3 && arousal(n)>=7)
        VA(n) = 3; %3er cuadrante - LVHA
    end
    
    if(valence(n)<=3 && 4 <= arousal(n) && arousal(n)<=6)
        VA(n) = 4; %4o cuadrante - LVMA
    end

    if (4<=valence(n) && valence(n)<=6 && 4<=arousal(n) && arousal(n)<=6)
        VA(n) = 5; %5o cuadrante - MVMA
    end
    
    if (valence(n)>=7 && 4<=arousal(n) && arousal(n)<=6)
        VA(n) = 6; %6o cuadrante - HVMA
    end
    
    if(valence(n)>=7 && arousal(n)<=3)
        VA(n) = 7; %7o cuadrante - HVLA
    end

    if (4<=valence(n) && valence(n)<=6 && arousal(n)<=3)
        VA(n) = 8; %8o cuadrante - MVLA
    end
    
    %%%% No hay ningún valor en este cuadrante en todo el experimento %%%%
    if (valence(n)<=3 && arousal(n)<=3)
        VA(n) = 9; %9o cuadrante - LVLA
    end
end 

VA_ = VA;

end