function [HR_mean, HR] = media_HR(pulsos_totales, numero_de_pulso)

i = 2:pulsos_totales;

for i = 2:pulsos_totales
    HR(i-1) = 60/((numero_de_pulso(i)/64)-(numero_de_pulso(i-1)/64));
end

HR_mean = sum(HR)/length(HR); 
%media_HR_comprobacion = mean(HR);

end