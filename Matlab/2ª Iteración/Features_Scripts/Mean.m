%Media de la se�al

m = mean (signal.wrist.EDA) ;

%Utilizando c�digo de MATLAB

y = signal.wrist.EDA ;

suma = 0 ;

for n=1 : length(y)
    
    suma = suma + y(n) ;
    
end

media = suma/length(y) ;
