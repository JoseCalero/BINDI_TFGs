function GSR_phasic = GSR_get_SCR(GSRsignal)

%Cogemos ventanas de 4 segundos
tWindowSec = 4;

samprate = 4;

%Calculamos la mediana de la señal.
GSR_median = movmedian(GSRsignal, [tWindowSec*samprate tWindowSec*samprate]);

%La señal fásica es el resultado de la resta entre la señal y la mediana
GSR_phasic = GSRsignal - GSR_median;

end

