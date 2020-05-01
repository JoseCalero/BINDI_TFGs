function std = Signal_feat_std(Signal)

suma = 0;

for n=1 : length(Signal)
    
    suma = suma + Signal(n);
    
end

media = suma/length(Signal);

%----> C�lculo de la desviaci�n t�pica

numerador = 0;

for n=1 : length(Signal)
    
    numerador = numerador + (Signal(n)-media)^2;
    
end

std = sqrt (numerador/(length(Signal)-1));

end

