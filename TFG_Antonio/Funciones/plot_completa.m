%% FUNCION QUE REPRESENTA LA SEÑAL COMPLETA
%

function plot_completa(signal_wrist_BVP, HR_mean, HR_std, HRV_mean, HRV_std, HRV_rms)

tiempo_final = length(signal_wrist_BVP);
tiempo_inicial = 1; 

hold on

plot(tiempo_inicial:tiempo_final, signal_wrist_BVP(tiempo_inicial:tiempo_final));

%
% Muestreo de caracteristicas
%

HR_graf_m = linspace(HR_mean,HR_mean, tiempo_final-tiempo_inicial+1);
plot(tiempo_inicial:tiempo_final,HR_graf_m,'r');

HR_graf_s = linspace(HR_std,HR_std,tiempo_final-tiempo_inicial+1);
plot(tiempo_inicial:tiempo_final,HR_graf_s,'m');

HRV_graf_m = linspace(HRV_mean,HRV_mean, tiempo_final-tiempo_inicial+1);
plot(tiempo_inicial:tiempo_final,HRV_graf_m,'b')

HRV_graf_s = linspace(HRV_std,HRV_std, tiempo_final-tiempo_inicial+1);
plot(tiempo_inicial:tiempo_final,HRV_graf_s,'k');

HRV_graf_rms = linspace(HRV_rms,HRV_rms, tiempo_final-tiempo_inicial+1);
plot(tiempo_inicial:tiempo_final,HRV_graf_rms,'g');

legend('Señal BVP','HR mean','HR std','HRV mean','HRVstd','HRV rms');

hold off

axis tight
title('Ventana completa ~ 110 min');
xlabel('Fs = 64 Hz');
ylabel('Valor de BVP');
grid

end