%% REPRESENTACION DE CARACTERISTICAS EN FRECUENCIA
%

function plot_frecuencia_auxiliar(n, ventanas, signalHRV)

n_total_intervalos_frec = length(signalHRV);
[fft_BVP_imagen, vector_frecuencia] = fft_signal_wrist_BVP(signalHRV, n_total_intervalos_frec);

%
% Nos quedamos con la primera mitad de la imagen
%

[fft_BVP, vector_frecuencia_single] = fft_BVP_sin_imagen(fft_BVP_imagen, vector_frecuencia);

figure(1)
plot(vector_frecuencia_single, fft_BVP/n_total_intervalos_frec); 

[ULF_frec, ULF_signal, LF_frec, LF_signal, HF_frec, HF_signal, UHF_frec, UHF_signal, fft_BVP_frec, fft_BVP_final] = bandas_frec(signalHRV, fft_BVP, n_total_intervalos_frec);

sum_ULF = f_sum_frec(ULF_frec, fft_BVP, n_total_intervalos_frec);
sum_LF = f_sum_frec(LF_frec, fft_BVP, n_total_intervalos_frec);
sum_HF = f_sum_frec(HF_frec, fft_BVP, n_total_intervalos_frec);
sum_UHF = f_sum_frec(UHF_frec, fft_BVP, n_total_intervalos_frec);

figure(2)
hold on
plot(ULF_frec, ULF_signal/n_total_intervalos_frec,'k')
plot(LF_frec, LF_signal/n_total_intervalos_frec,'r')
plot(HF_frec, HF_signal/n_total_intervalos_frec,'m')
plot(UHF_frec, UHF_signal/n_total_intervalos_frec,'g')
plot(fft_BVP_frec, fft_BVP_final/n_total_intervalos_frec,'b');

title('PSD BVP Signal');
xlabel('Frecuency (Hz)');
ylabel('Amplitude');
legend('ULF','LF','HF','UHF');

hold off
grid

end