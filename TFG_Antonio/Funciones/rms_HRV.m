function rms_HRV = rms_HRV(pulsos_totales, numero_de_pulso)

i = 2:pulsos_totales;

rms_HRV = sqrt(sum((numero_de_pulso(i)-numero_de_pulso(i-1)).^2)/pulsos_totales);

end