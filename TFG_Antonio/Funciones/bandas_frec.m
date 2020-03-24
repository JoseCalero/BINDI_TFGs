%% BANDAS DE FRECUENCIA
%

function [ULF_frec, ULF_signal, LF_frec, LF_signal, HF_frec, HF_signal, UHF_frec, UHF_signal, fft_BVP_frec, fft_BVP_final] = bandas_frec(signal_wrist_BVP, fft_BVP, n_total_intervalos_frec)
%
% Ahora ya podemos trabajar con de la gráfica directamente
% ULF: 0,01 Hz - 0,04 Hz --> omitimos la banda de ULF 
% LF: 0,04 Hz - 0,15 Hz
% HF: 0,15 Hz - 0,4 Hz
% UHF: 0,4 Hz - 1,0 Hz
%
% Para sacar ULFinicio y ULFfin utilizamos la relación de la siguiente
% formula: intervalo(fft) = frecuencia_buscada*n_tot_interv/frec_señal
%

ULFinicio = round(0.01*length(signal_wrist_BVP)/64);
ULFfin = round(0.04*length(signal_wrist_BVP)/64);
ULF_signal = fft_BVP(ULFinicio:ULFfin);
ULF_tiempos = ULFinicio:ULFfin;
ULF_frec = ULF_tiempos*64/n_total_intervalos_frec;

LFinicio = round(0.04*length(signal_wrist_BVP)/64);
LFfin = round(0.15*length(signal_wrist_BVP)/64);
LF_signal = fft_BVP(LFinicio:LFfin);
LF_tiempos = LFinicio:LFfin;
LF_frec = LF_tiempos*64/n_total_intervalos_frec;

HFinicio = round(0.15*length(signal_wrist_BVP)/64);
HFfin = round(0.4*length(signal_wrist_BVP)/64);
HF_signal = fft_BVP(HFinicio:HFfin);
HF_tiempos = HFinicio:HFfin;
HF_frec = HF_tiempos*64/n_total_intervalos_frec;

UHFinicio = round(0.4*length(signal_wrist_BVP)/64);
UHFfin = round(1*length(signal_wrist_BVP)/64);
UHF_signal = fft_BVP(UHFinicio:UHFfin);
UHF_tiempos = UHFinicio:UHFfin;
UHF_frec = UHF_tiempos*64/n_total_intervalos_frec;

fft_BVPinicio = UHFfin;
fft_BVPfinal = round(32*length(signal_wrist_BVP)/64);
fft_BVP_final = fft_BVP(fft_BVPinicio:fft_BVPfinal);
fft_BVP_tiempos = fft_BVPinicio:fft_BVPfinal;
fft_BVP_frec = fft_BVP_tiempos*64/n_total_intervalos_frec;

end