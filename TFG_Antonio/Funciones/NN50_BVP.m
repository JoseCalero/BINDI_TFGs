function [NN50, pNN50] = NN50_BVP(HRV)

NN50 = 0; %Recoge las veces que los intervalos P-P difieren más de 50ms

for i = 2:length(HRV)

    if (abs(HRV(i) - HRV(i-1)) > 0.05) %Si la diferencia es mayor de 50ms
        NN50 = NN50 + 1;
    end
    
end

pNN50 = (NN50/(length(HRV)-1))*100;

end