function mean_HRV = media_HRV(pulsos_totales, numero_de_pulso)

i = 2:pulsos_totales;

%Valor en s
mean_HRV = ((sum((1/64)*numero_de_pulso(i)-(1/64)*numero_de_pulso(i-1)))/pulsos_totales);

end