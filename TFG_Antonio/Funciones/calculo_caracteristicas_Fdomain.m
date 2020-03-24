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
[fft_BVP_imagen, vector_frecuencia] = fft_signal_wrist_BVP(signal_wrist_BVP, n_total_intervalos_frec);


%% NOS QUEDAMOS CON LA IMAGEN IZQUIERDA DE LA FIGURA
%
%
[fft_BVP, ~] = fft_BVP_sin_imagen(fft_BVP_imagen, vector_frecuencia);


%% SACAMOS LAS BANDAS DE FRECUENCIA DE LA SEÑAL PARA LOS CALCULOS
%
%
[ULF_frec, ULF_signal, LF_frec, LF_signal, HF_frec, HF_signal, UHF_frec, UHF_signal, ~, ~] = bandas_frec(signal_wrist_BVP, fft_BVP, n_total_intervalos_frec);


%% Energía de las bandas de frecuencia
%
%
ULF_en = ULF_signal.^2;
ULF_energia = max(ULF_en);
caracteristica(1) = ULF_energia;

LF_en = LF_signal.^2;
LF_energia = max(LF_en);
caracteristica(2) = LF_energia;

HF_en = HF_signal.^2;
HF_energia = max(HF_en);
caracteristica(3) = HF_energia;

UHF_en = UHF_signal.^2;
UHF_energia = max(UHF_en);
caracteristica(4) = UHF_energia;


%% Potencia relativa LF/HF
%
%
Ratio_LFHF = LF_en/HF_en;
caracteristica(5) = Ratio_LFHF;


%% Sumatorio de las componentes de frecuencia
%
%
sum_ULF = f_sum_frec(ULF_frec, fft_BVP, n_total_intervalos_frec);
caracteristica(6) = sum_ULF;

sum_LF = f_sum_frec(LF_frec, fft_BVP, n_total_intervalos_frec);
caracteristica(7) = sum_LF;

sum_HF = f_sum_frec(HF_frec, fft_BVP, n_total_intervalos_frec);
caracteristica(8) = sum_HF;

sum_UHF = f_sum_frec(UHF_frec, fft_BVP, n_total_intervalos_frec);
caracteristica(9) = sum_UHF;


%% LF y HF normalizadas
%
% LFnorm = LF/(LF+HF)
% HFnorm = HF/(LF+HF)
%
LFnorm = LF_energia/(LF_energia+HF_energia);
caracteristica(10) = LFnorm;

HFnorm = HF_energia/(LF_energia+HF_energia);
caracteristica(11) = HFnorm;


end