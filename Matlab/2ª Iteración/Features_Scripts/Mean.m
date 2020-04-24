%Media de la señal

m = mean (signal.wrist.EDA) ;

%Utilizando código de MATLAB

y = signal.wrist.EDA ;

suma = 0 ;

for n=1 : length(y)
    
    suma = suma + y(n) ;
    
end

media = suma/length(y) ;
