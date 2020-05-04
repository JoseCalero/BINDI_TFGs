function [mean_HRV, HRV] = media_HRV(pulsos_totales, numero_de_pulso)

for i = 2:pulsos_totales
    IBIs(i-1) = (1/64)*numero_de_pulso(i) - (1/64)*numero_de_pulso(i-1);
end

for i = 2:length(IBIs)
    HRV(i-1) = abs(IBIs(i) - IBIs(i-1));
end

%Valor en s

mean_HRV = sum(HRV)/length(HRV);
%media_HRV_comprobacion = mean(HRV);

end