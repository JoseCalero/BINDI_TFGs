%% CALCULO DE CARACTERISTICAS EN FREQUENCY-DOMAIN
%

function caracteristica = calculo_caracteristicas_Fdomain(n, ventanas, signal_wrist_completa)
%% SEÑAL BVP EN EL VENTANADO DE 8 SEGUNDOS
%
%
signal_wrist_BVP = signal_wrist_completa(ventanas(n):ventanas(n+1));

%% TRANSFORMAMOS LA SEÑAL A F-DOMAIN CON FOURIER
%
%
n_total_intervalos_frec = length(signal_wrist_BVP);
[fft_BVP_imagen, vector_frecuencia_imagen] = fft_signal_wrist_BVP(signal_wrist_BVP, n_total_intervalos_frec);


%% NOS QUEDAMOS CON LA IMAGEN IZQUIERDA DE LA FIGURA
%
%
[fft_BVP, vector_frecuencia] = fft_BVP_sin_imagen(fft_BVP_imagen, vector_frecuencia_imagen);

%% SACAMOS LAS BANDAS DE FRECUENCIA DE LA SEÑAL PARA LOS CALCULOS
%
%
[LF_signal, HF_signal, UHF_signal] = bandas_frec(fft_BVP, vector_frecuencia);

%% OPERACIONES DE SUMATORIO DE LAS BANDAS DE FRECUENCIA
%
%

sum_LF = f_sum_frec(LF_signal);
caracteristica(1) = sum_LF;

sum_HF = f_sum_frec(HF_signal);
caracteristica(2) = sum_HF;

sum_UHF = f_sum_frec(UHF_signal);
caracteristica(3) = sum_UHF;

%% ENERGÍA DE LAS BANDAS DE FRECUENCIA
%
%

LF_energia = log(sum_LF);
caracteristica(4) = LF_energia;

HF_energia = log(sum_HF);
caracteristica(5) = HF_energia;

UHF_energia = log(sum_UHF);
caracteristica(6) = UHF_energia;

%% POTENCIA RELATIVA LF/HF
%
%

Ratio_LFHF = LF_energia/HF_energia;
caracteristica(7) = Ratio_LFHF;

%% LF Y HF NORMALIZADAS
%
% LFnorm = LF/(LF+HF)
% HFnorm = HF/(LF+HF)
%

LFnorm = LF_energia/(LF_energia+HF_energia);
caracteristica(8) = LFnorm;

HFnorm = HF_energia/(LF_energia+HF_energia);
caracteristica(9) = HFnorm;

%% POTENCIA RELATIVA DE LA COMPONENTE DE LA FRECUENCIA
%
%

Rel_power_LF = relative_power(LF_energia, HF_energia, UHF_energia);
caracteristica(10) = Rel_power_LF;

Rel_power_HF = relative_power(HF_energia, LF_energia, UHF_energia);
caracteristica(11) = Rel_power_HF;

Rel_power_UHF = relative_power(UHF_energia, HF_energia, LF_energia);
caracteristica(12) = Rel_power_UHF;

end