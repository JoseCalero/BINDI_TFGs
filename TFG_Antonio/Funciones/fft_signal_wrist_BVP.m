%% FUNCION QUE PERMITE HACER LA TRANSFORMADA DE LA SEÑAL
%

function [fft_signal_wrist_BVP, vector_frecuencia] = fft_signal_wrist_BVP(signal_wrist_BVP, n_total_intervalos_frec)

Transformada = fft(signal_wrist_BVP); % Valores absolutos de la transformada de fourier
fft_signal_wrist_BVP = abs(Transformada);

%
% bin_resoluton = fmuestreo/N  --> bin_res = 64/512 = 0.125 ///// 64/513 =
% 0.1248
%

vector_de_intervalos = (0:n_total_intervalos_frec-1); % Vector de intervalos (matlab representa a partir de 1)
vector_frecuencia = vector_de_intervalos*64/n_total_intervalos_frec; % Vector de las frecuencias reales

end