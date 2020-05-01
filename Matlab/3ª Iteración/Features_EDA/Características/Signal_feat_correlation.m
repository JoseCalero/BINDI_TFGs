function correlation = Signal_feat_correlation(GSR_tonic)

%Media de las variables x e y

sumaY = 0;
sumaX = 0;

for n=1 : length(GSR_tonic)
    
    sumaY = sumaY + GSR_tonic(n) ;
    
    sumaX = sumaX + n/4;
    
end

mediaY = sumaY/length(GSR_tonic);

mediaX = sumaX/length(GSR_tonic);

%Desviación típica de las variables x e y

numeradorY = 0;
numeradorX = 0;

for n=1 : length(GSR_tonic)
    
    numeradorY = numeradorY + (GSR_tonic(n)-mediaY)^2 ;
    numeradorX = numeradorX + (n/4 - mediaX)^2;
end

desviacionY = sqrt (numeradorY/(length(GSR_tonic)-1));
desviacionX = sqrt (numeradorX/(length(GSR_tonic)-1));

%Cálculo de la covarianza

sumaY = 0;

for n=1 : length(GSR_tonic)

    sumaY = sumaY + (n/4 - mediaX)*(GSR_tonic(n) - mediaY);
    
end

cov=sumaY/(length(GSR_tonic)-1);

%Coeficiente de Correlación de PEARSON

correlation=(cov/(desviacionX*desviacionY));

end

