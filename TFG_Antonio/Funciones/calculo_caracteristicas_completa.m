%% CALCULO DE CARACTERISTICAS PARA TODA LA SEÑAL
%

function [NN50, pNN50, HR_mean, HR_std, HRV_mean, HRV_std, HRV_rms] = calculo_caracteristicas_completa(signal_wrist_BVP)
%% VARIABLES AUXILIARES PARA LA OBTENCIÓN DE CARACTERÍSTICAS
%
%
[numero_de_pulso, pulsos_totales] = variables_aux(signal_wrist_BVP, 1, length(signal_wrist_BVP)); 

[NN50, pNN50] = NN50_BVP(pulsos_totales, numero_de_pulso);

%% HR = 60 / P-P interval - RESPECTO AL TOTAL DE LA SEÑAL
%
%
HR_mean = media_HR(pulsos_totales, numero_de_pulso);
HR_std = desviacion_HR(HR_mean, pulsos_totales, numero_de_pulso);


%% HRV: Time interval between heartbeats
%
%
HRV_mean = media_HRV(pulsos_totales, numero_de_pulso);
HRV_std = desviacion_HRV(HRV_mean, pulsos_totales, numero_de_pulso);


%% HRV_RMS
%
%
HRV_rms = rms_HRV(pulsos_totales, numero_de_pulso);


%% TINN
% Hay que guardar en un vector los datos de tiempos de HRV
% y en otro el número de veces que éstos se repiten
%TINN = TINN_funct(pulsos_totales);


%% Características: dominio en frecuencia
%
%
n_total_intervalos_frec = length(signal_wrist_BVP);
[fft_BVP_imagen, vector_frecuencia] = fft_signal_wrist_BVP(signal_wrist_BVP, n_total_intervalos_frec);
%
% Nos quedamos con la primera mitad de la imagen
%
[fft_BVP, vector_frecuencia_single] = fft_BVP_sin_imagen(fft_BVP_imagen, vector_frecuencia);

figure
plot(vector_frecuencia_single, fft_BVP/n_total_intervalos_frec); 

[ULF_frec, ULF_signal, LF_frec, LF_signal, HF_frec, HF_signal, UHF_frec, UHF_signal, fft_BVP_frec, fft_BVP_final] = bandas_frec(signal_wrist_BVP, fft_BVP, n_total_intervalos_frec);


%% Energía de las bandas de frecuencia
%
%
ULF_en = ULF_signal.^2;
ULF_energia = max(ULF_en);
LF_en = LF_signal.^2;
LF_energia = max(LF_en);
HF_en = HF_signal.^2;
HF_energia = max(HF_en);
UHF_en = UHF_signal.^2;
UHF_energia = max(UHF_en);


%% Potencia relativa LF/HF
%
%
Ratio_LFHF = LF_en/HF_en;


%% Sumatorio de las componentes de frecuencia
%
%
sum_ULF = f_sum_frec(ULF_frec, fft_BVP, n_total_intervalos_frec);
sum_LF = f_sum_frec(LF_frec, fft_BVP, n_total_intervalos_frec);
sum_HF = f_sum_frec(HF_frec, fft_BVP, n_total_intervalos_frec);
sum_UHF = f_sum_frec(UHF_frec, fft_BVP, n_total_intervalos_frec);


%% LF y HF normalizadas
%
% LFnorm = LF/(LF+HF)
% HFnorm = HF/(LF+HF)
%
LFnorm = LF_energia/(LF_energia+HF_energia);
HFnorm = HF_energia/(LF_energia+HF_energia);


end