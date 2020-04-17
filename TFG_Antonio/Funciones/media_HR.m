function HR_mean = media_HR(pulsos_totales, numero_de_pulso)

i = 2:pulsos_totales;

HR_mean = sum(60./((numero_de_pulso(i)/64)-(numero_de_pulso(i-1)/64)))/pulsos_totales; 

end