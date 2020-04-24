%Coeficiente de correlaci�n con el tiempo

%Definici�n de las variables de las que se va a calcular el �ndice de
%correlaci�n

signalT = find (label) ;

timeSignal = (4/700)*(signalT(end) - signalT(1)) ;

x = linspace (0, timeSignal, timeSignal) ;

y = signal.wrist.EDA ;

%Media de las variables x e y

suma = 0 ;

for n=1 : length(y)
    
    suma = suma + y(n) ;
    
end

mediaY = suma/length(y) ;

suma = 0 ;

for n=1 : length(x)
    
    suma = suma + x(n) ;
    
end

mediaX = suma/length(x) ;

%Desviaci�n t�pica de las variables x e y

numerador = 0 ;

for n=1 : length(y)
    
    numerador = numerador + (y(n)-mediaY)^2 ;
    
end

desviacionY = sqrt (numerador/length(y)) ;

numerador = 0 ;

for n=1 : length(x)
    
    numerador = numerador + (x(n)-mediaX)^2 ;
    
end

desviacionX = sqrt (numerador/length(x)) ;

%C�lculo de la covarianza

suma = 0 ;

for n=1 : length(x)

    suma = suma + (x(n) - mediaX)*(y(n) - mediaY);
    
end

cov=suma/length(x);

%Correlaci�n

corr=cov/(desviacionX*desviacionY);

