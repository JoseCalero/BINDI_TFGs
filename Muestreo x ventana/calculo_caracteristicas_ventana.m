%% Calculo de caracteristicas para una ventana

function [NN50, pNN50, HR_mean, HR_std, HRV_mean, HRV_std, HRV_rms] = calculo_caracteristicas_ventana(n, signal_wrist_BVP)
%% SACAMOS LAS VENTANAS PARA PASARLE LAS POSICIONES CORRECTAS DE EXTRACCIÓN
ventanas = Ventanas_8s(signal_wrist_BVP);

%% VARIABLES AUXILIARES PARA LA OBTENCIÓN DE CARACTERÍSTICAS
[numero_de_pulso, pulsos_totales] = variables_aux(signal_wrist_BVP, ventanas(n), ventanas(n+1)); 

[NN50, pNN50] = NN50_BVP(pulsos_totales, numero_de_pulso);

%% HR = 60 / P-P interval - RESPECTO AL TOTAL DE LA SEÑAL
HR_mean = media_HR(pulsos_totales, numero_de_pulso);
HR_std = desviacion_HR(HR_mean, pulsos_totales, numero_de_pulso);

%% HRV: Time interval between heartbeats
HRV_mean = media_HRV(pulsos_totales, numero_de_pulso);
HRV_std = desviacion_HRV(HRV_mean, pulsos_totales, numero_de_pulso);

%% HRV_RMS
HRV_rms = rms_HRV(pulsos_totales, numero_de_pulso);

% TINN
% Hay que guardar en un vector los datos de tiempos
% y en otro el número de veces que éstos se repiten

%n_total_intervalos_frec = length(signal.wrist.BVP);
%[fft_BVP_imagen, vector_frecuencia] = fft_signal_wrist_BVP(signal_wrist_BVP, n_total_intervalos_frec);

% Nos quedamos con la primera mitad de la imagen
%[fft_BVP, vector_frecuencia_single] = fft_BVP_sin_imagen(fft_BVP_imagen, vector_frecuencia);

%figure(1)
%plot(vector_frecuencia_single, fft_BVP/n_total_intervalos_frec); 

%[ULF_frec, ULF_signal, LF_frec, LF_signal, HF_frec, HF_signal, UHF_frec, UHF_signal, fft_BVP_frec, fft_BVP_final] = bandas_frec(signal_wrist_BVP, fft_BVP, n_total_intervalos_frec);

%sum_ULF = sum_frec(ULF_frec, fft_BVP, n_total_intervalos_frec);
%sum_LF = sum_frec(LF_frec, fft_BVP, n_total_intervalos_frec);
%sum_HF = sum_frec(HF_frec, fft_BVP, n_total_intervalos_frec);
%sum_UHF = sum_frec(UHF_frec, fft_BVP, n_total_intervalos_frec);

%figure(2)
%hold on
%plot(ULF_frec, ULF_signal/n_total_intervalos_frec,'k')
%plot(LF_frec, LF_signal/n_total_intervalos_frec,'r')
%plot(HF_frec, HF_signal/n_total_intervalos_frec,'m')
%plot(UHF_frec, UHF_signal/n_total_intervalos_frec,'g')
%plot(fft_BVP_frec, fft_BVP_final/n_total_intervalos_frec,'b');

%title('PSD BVP Signal');
%xlabel('Frecuency (Hz)');
%ylabel('Amplitude');

%hold off
%grid

end
