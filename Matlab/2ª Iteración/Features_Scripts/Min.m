%M�nimo de la funci�n

%min = min (signal.wrist.EDA) 

%Realizando la misma funci�n en c�digo

y = signal.wrist.EDA ;

minimo_1 = y(1) ;


for n=1: length(y)
    if (y(n) < minimo_1)
        minimo_1 = y(n) ;
    end
end

