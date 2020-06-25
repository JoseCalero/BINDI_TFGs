%% FUNCION QUE REPRESENTA LA VENTANA DESEADA
%

function plot_ventana(ventanas_8s, signal_wrist_BVP, n_ventana, caracteristica)

tiempo_final = ventanas_8s(n_ventana(end) + 1);
tiempo_inicial = ventanas_8s(n_ventana(1)); 

hold on

plot(tiempo_inicial:tiempo_final, signal_wrist_BVP(tiempo_inicial:tiempo_final));

%
% Muestreo de caracteristicas
%

HR_graf_m = linspace(caracteristica(1),caracteristica(1), tiempo_final-tiempo_inicial+1);
plot(tiempo_inicial:tiempo_final,HR_graf_m,'r');

HR_graf_s = linspace(caracteristica(2),caracteristica(2),tiempo_final-tiempo_inicial+1);
plot(tiempo_inicial:tiempo_final,HR_graf_s,'m');

HRV_graf_m = linspace(caracteristica(3),caracteristica(3), tiempo_final-tiempo_inicial+1);
plot(tiempo_inicial:tiempo_final,HRV_graf_m,'b')

HRV_graf_s = linspace(caracteristica(4),caracteristica(4), tiempo_final-tiempo_inicial+1);
plot(tiempo_inicial:tiempo_final,HRV_graf_s,'k');

%HRV_graf_rms = linspace(caracteristica(5),caracteristica(5), tiempo_final-tiempo_inicial+1);
%plot(tiempo_inicial:tiempo_final,HRV_graf_rms,'g');

%legend('Señal BVP','HR mean','HR std','HRV mean','HRVstd','HRV rms');

hold off

axis tight
title('Ventana de 16s');
xlabel('Fs = 64 Hz');
ylabel('BVP');
grid

end