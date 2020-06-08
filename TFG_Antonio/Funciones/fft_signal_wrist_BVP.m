%% FUNCION QUE PERMITE HACER LA TRANSFORMADA DE LA SE�AL
%


function [fft_signal_HRV, vector_frecuencia] = fft_signal_wrist_BVP(HRV, vector_pos)

vector_pos = vector_pos./64;

% Plomb nos interpola valores de la se�al estimando nuevos entre las
% posiciones dadas vector_pos y nos amplia el vector de frec
%
% Hace el mismo trabajo que pwelch para datos perdidos
%

[fft_signal_HRV, f] = plomb(HRV, vector_pos);

% Si no hici�ramos Pwelch:
%
%Transformada = fft(HRV2); 
%fft_signal_HRV = abs(Transformada);
%fft_signal_HRV = fft_signal_HRV.^2; 

% Nota: Pwelch no se puede hacer con menos de 8 muestras
%
%
% bin_resoluton = fmuestreo/N  --> bin_res = 64/512 = 0.125 
%

%fs = n_total_intervalos_frec/8; % n muestras x segundo = fs (Hz)

vector_frecuencia = f; % Vector de frec(matlab representa a partir de 1)

%vector_de_intervalos*fs/n_total_intervalos_frec; % Vector de las frecuencias reales
    
end