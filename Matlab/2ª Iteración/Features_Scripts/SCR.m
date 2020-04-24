%Obtención de la componente fásica de la señal.
%Medida a 4Hz

y = signal.wrist.EDA ;

%Mediana de la señal

j = 1 ;

for i=16 : (length (y)-15)
    
    A = linspace (y(i-15), y(i+15), 32) ;
    
    x(j) = median (A) ;
    
    j = j+1 ;
    
end

hold on 

plot (x) ;

%plot (y) ;

grid
