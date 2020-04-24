%Desviación típica de la señal

s = std (signal.wrist.EDA) ;

%Cálculo a través del código de MATLAB

%----> Cálculo de la media

y = signal.wrist.EDA ;

suma = 0 ;

for n=1 : length(y)
    
    suma = suma + y(n) ;
    
end

media = suma/length(y) ;

%----> Cálculo de la desviación típica

numerador = 0 ;

for n=1 : length(y)
    
    numerador = numerador + (y(n)-media)^2 ;
    
end

desviacion = sqrt (numerador/length(y)) ;