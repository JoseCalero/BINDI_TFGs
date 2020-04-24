%Rango de la función

range = range (signal.wrist.EDA) ;

%Utilizando código de MATLAB

y = signal.wrist.EDA ;

min = y(1) ;

max = y(1) ;

for n=1: length(y)
    if (y(n) < min)
        min = y(n) ;
    end
end

for n=1: length(y)
    if (y(n) > max)
        max = y(n) ;
    end
end

rango = max - min ;
