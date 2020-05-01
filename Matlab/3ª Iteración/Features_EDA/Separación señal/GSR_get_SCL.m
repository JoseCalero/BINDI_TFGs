function GSR_tonic = GSR_get_SCL(GSRsignal)

%Cogemos ventanas de 4 segundos
tWindowSec = 4;

%Frecuencia de muestreo
samprate = 4;


%Calculamos la mediana de la se�al de cada elemento de la se�al comparado
%con los restantes pertenecientes a la ventana, cuyo resultado nos da la se�al t�nica.

GSR_median = movmedian(GSRsignal, [tWindowSec*samprate 15]);
GSR_tonic  = GSR_median;

end

