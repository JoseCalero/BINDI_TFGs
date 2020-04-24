%Desviaci�n t�pica de la se�al

s = std (signal.wrist.EDA) ;

%C�lculo a trav�s del c�digo de MATLAB

%----> C�lculo de la media

y = signal.wrist.EDA ;

suma = 0 ;

for n=1 : length(y)
    
    suma = suma + y(n) ;
    
end

media = suma/length(y) ;

%----> C�lculo de la desviaci�n t�pica

numerador = 0 ;

for n=1 : length(y)
    
    numerador = numerador + (y(n)-media)^2 ;
    
end

desviacion = sqrt (numerador/length(y)) ;