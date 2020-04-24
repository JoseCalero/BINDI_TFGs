function GSR_phasic = GSR_get_SCR(GSRsignal)

%Cogemos ventanas de 4 segundos
tWindowSec = 4;

samprate = 4;

%Calculamos la mediana de la se�al.
GSR_median = movmedian(GSRsignal, [tWindowSec*samprate tWindowSec*samprate]);

%La se�al f�sica es el resultado de la resta entre la se�al y la mediana
GSR_phasic = GSRsignal - GSR_median;

end

