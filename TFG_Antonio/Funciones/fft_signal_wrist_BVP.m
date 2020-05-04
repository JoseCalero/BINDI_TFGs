%% FUNCION QUE PERMITE HACER LA TRANSFORMADA DE LA SEÑAL
%

function [fft_signal_HRV, vector_frecuencia] = fft_signal_wrist_BVP(HRV, n_total_intervalos_frec)

Transformada = fft(HRV); % Valores absolutos de la transformada de fourier
fft_signal_HRV = abs(Transformada);
fft_signal_HRV = fft_signal_HRV.^2; % Pwelch no se puede hacer con menos de 8 muestras

%
% bin_resoluton = fmuestreo/N  --> bin_res = 64/512 = 0.125 
%

fs = n_total_intervalos_frec/8; % n muestras x segundo = fs (Hz)

vector_de_intervalos = (0:n_total_intervalos_frec-1); % Vector de intervalos (matlab representa a partir de 1)
vector_frecuencia = vector_de_intervalos*fs/n_total_intervalos_frec; % Vector de las frecuencias reales
    
end