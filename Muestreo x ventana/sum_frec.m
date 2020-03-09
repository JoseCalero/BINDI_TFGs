% Sumatorio de una banda de frecuencias
function sum_frec = sum_frec(tiempos, fft_BVP, n_total_intervalos_frec)

Finicio = tiempos(1)*n_total_intervalos_frec/64;
Ffin = tiempos(end)*n_total_intervalos_frec/64;
sum_frec = sum(fft_BVP(Finicio:Ffin));

end