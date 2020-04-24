function correlation = Signal_feat_correlation(GSR_tonic)

timeSignal = length(GSR_tonic)/4 ;

x = linspace (0, timeSignal, timeSignal) ;

%Media de las variables x e y

suma = 0 ;

for n=1 : length(GSR_tonic)
    
    suma = suma + GSR_tonic(n) ;
    
end

mediaY = suma/length(GSR_tonic) ;

suma = 0 ;

for n=1 : length(x)
    
    suma = suma + x(n) ;
    
end

mediaX = suma/length(x) ;

%Desviación típica de las variables x e y

numerador = 0 ;

for n=1 : length(GSR_tonic)
    
    numerador = numerador + (GSR_tonic(n)-mediaY)^2 ;
    
end

desviacionY = sqrt (numerador/length(GSR_tonic)) ;

numerador = 0 ;

for n=1 : length(x)
    
    numerador = numerador + (x(n)-mediaX)^2 ;
    
end

desviacionX = sqrt (numerador/length(x)) ;

%Cálculo de la covarianza

suma = 0 ;

for n=1 : length(x)

    suma = suma + (x(n) - mediaX)*(GSR_tonic(n) - mediaY);
    
end

cov=suma/length(x);

%Coeficiente de Correlación de PEARSON

correlation=cov/(desviacionX*desviacionY);

end

