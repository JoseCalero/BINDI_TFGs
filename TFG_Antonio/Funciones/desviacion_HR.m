function std_HR = desviacion_HR(mean_HR, pulsos_totales, numero_de_pulso)

i = 2:pulsos_totales;

std_HR = sqrt((sum(((60./((numero_de_pulso(i)/64)-(numero_de_pulso(i-1)/64)))-mean_HR).^2))/pulsos_totales);

end