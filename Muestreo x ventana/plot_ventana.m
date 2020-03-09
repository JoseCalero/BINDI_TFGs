% Función que me representa la ventana que yo quiero

function plot_ventana(ventanas_8s, signal_wrist_BVP, n_ventana, HR_mean, HR_std, HRV_mean, HRV_std, HRV_rms)

tiempo_final = ventanas_8s(n_ventana + 1);
tiempo_inicial = ventanas_8s(n_ventana); 

hold on

plot(tiempo_inicial:tiempo_final, signal_wrist_BVP(tiempo_inicial:tiempo_final));
% Muestreo de caracteristicas
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
title('Ventana de 8s');
xlabel('Fs = 64 Hz');
ylabel('Valor de BVP');
grid

end