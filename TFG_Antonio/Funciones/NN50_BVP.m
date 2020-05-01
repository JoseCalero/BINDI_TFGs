function [NN50, pNN50] = NN50_BVP(pulsos_totales, numero_de_pulso)

NN50 = 0; %Recoge las veces que los intervalos P-P difieren más de 50ms
vector_valores_HRV = 0;

for i = 2:pulsos_totales
    
    vector_valores_HRV(i-1) = numero_de_pulso(i) - numero_de_pulso(i-1);
    
end

for i = 2:length(vector_valores_HRV)

    if (abs(vector_valores_HRV(i)/64 - vector_valores_HRV(i-1)/64) > 0.05) %Si la diferencia es mayor de 50ms
        NN50 = NN50 + 1;
    end
    
end

pNN50 = (NN50/(length(vector_valores_HRV)-1))*100;

end