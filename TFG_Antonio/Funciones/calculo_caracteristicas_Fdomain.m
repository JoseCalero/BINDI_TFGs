%% CALCULO DE CARACTERISTICAS EN FREQUENCY-DOMAIN
%

function caracteristica = calculo_caracteristicas_Fdomain(HRV, vector_pos)
%% TRANSFORMAMOS LA SEÑAL A F-DOMAIN CON FOURIER
%
%

[fft_HRV, vector_frecuencia] = fft_signal_wrist_BVP(HRV, vector_pos);

%% SACAMOS LAS BANDAS DE FRECUENCIA DE LA SEÑAL PARA LOS CALCULOS
%
%

% TEAP function: BVP_feat_extr()
fft_HRV = fft_HRV/sum(fft_HRV);

[LF_signal, HF_signal, UHF_signal] = bandas_frec(fft_HRV, vector_frecuencia);

%% OPERACIONES DE SUMATORIO DE LAS BANDAS DE FRECUENCIA
%
%

sum_LF = f_sum_frec(LF_signal)*100;
caracteristica(1) = sum_LF;

sum_HF = f_sum_frec(HF_signal)*100;
caracteristica(2) = sum_HF;

sum_UHF = f_sum_frec(UHF_signal)*100;
caracteristica(3) = sum_UHF;

%% ENERGÍA DE LAS BANDAS DE FRECUENCIA
%
%
LF_energia = abs(log(sum_LF));
caracteristica(4) = LF_energia;

HF_energia = abs(log(sum_HF));
caracteristica(5) = HF_energia;

UHF_energia = abs(log(sum_UHF));
caracteristica(6) = UHF_energia;

%% POTENCIA RELATIVA LF/HF
%
%

Ratio_LFHF = abs(LF_energia/HF_energia);
caracteristica(7) = Ratio_LFHF;

%% LF Y HF NORMALIZADAS
%
% LFnorm = LF/(LF+HF)
% HFnorm = HF/(LF+HF)
%

LFnorm = abs(LF_energia/(LF_energia+HF_energia));
caracteristica(8) = LFnorm;

HFnorm = abs(HF_energia/(LF_energia+HF_energia));
caracteristica(9) = HFnorm;

%% POTENCIA RELATIVA DE LA COMPONENTE DE LA FRECUENCIA
%
%

Rel_power_LF = abs(relative_power(LF_energia, HF_energia, UHF_energia));
caracteristica(10) = Rel_power_LF;

Rel_power_HF = abs(relative_power(HF_energia, LF_energia, UHF_energia));
caracteristica(11) = Rel_power_HF;

Rel_power_UHF = abs(relative_power(UHF_energia, HF_energia, LF_energia));
caracteristica(12) = Rel_power_UHF;

end