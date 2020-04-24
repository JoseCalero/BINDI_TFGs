%Máximo de la función

%maximo = max (signal.wrist.EDA) ;

%Realizando la función en código

y = signal.wrist.EDA ;

maximo_1 = y(1) ;


for n=1: length(y)
    if (y(n) > maximo_1)
        maximo_1 = y(n) ;
    end
end