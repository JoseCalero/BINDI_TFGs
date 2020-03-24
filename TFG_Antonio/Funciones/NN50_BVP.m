function [NN50, pNN50] = NN50_BVP(pulsos_totales, numero_de_pulso)

NN50 = 0; %Recoge las veces que los intervalos P-P difieren más de 50ms

for i = 2:pulsos_totales
    if ((1/64)*(numero_de_pulso(i)-numero_de_pulso(i-1)) > 0.05) %Si la diferencia es mayor de 50ms
        NN50 = NN50 + 1;
    end
end

pNN50 = (NN50/pulsos_totales)*100;

end