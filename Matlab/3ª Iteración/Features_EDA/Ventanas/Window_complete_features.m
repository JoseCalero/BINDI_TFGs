%Función encargada de extraer todas las características, tanto las de las
%señal GSR como las de las componentes fásica y tónica.

function feature = Window_complete_features(signal, window, n)

%%COGEMOS LA PORCIÓN DE LA SEÑAL DE LA QUE QUEREMOS SACAR LAS
%CARACTERÍSTICAS

signal = signal(window(n):window(n+1));

i = 1; %Posicion de la caracteristica en el vector de window_feature

%%MEDIA PARA LA VENTANA

mean = Signal_feat_mean (signal);

feature(i) = mean;
i = i+1;

%%DESVIACION DE LA VENTANA

std = Signal_feat_std(signal);

feature(i) = std;
i = i+1;

%%MINIMO DE LA VENTANA

min = Signal_feat_min(signal);

feature(i) = min;
i = i+1;

%MAXIMO DE LA VENTANA

max = Signal_feat_max(signal);

feature(i) = max;
i = i+1;

%RANGO DE LA VENTANA

range = Signal_feat_range(signal);

feature(i) = range;
i = i+1;

%SLOPE DE LA VENTANA

slope = Signal_feat_slope(signal);

feature(i) = slope;
i = i+1;

%MEDIA DE LA VENTANA PARA LA SEÑAL SCL

GSR_tonic = GSR_get_SCL(signal);
mean_SCL = Signal_feat_mean (GSR_tonic);

feature(i) = mean_SCL;
i = i + 1;

%DESVIACION DE LA VENTANA PARA LA SEÑAL SCL

std_SCL = Signal_feat_std(GSR_tonic);

feature(i) = std_SCL;
i = i+1;

%CORRELACION DE LA VENTANA PARA LA SEÑAL SCL CON EL TIEMPO

correlation = Signal_feat_correlation(GSR_tonic);

feature(i) = correlation;
i = i + 1;

%DESVIACION DE LA VENTANA PARA LA SEÑAL SCR

GSR_phasic = GSR_get_SCR (signal);
std_SCR = Signal_feat_std (GSR_phasic);

feature(i) = std_SCR;
i = i + 1;

%NUMERO DE PICOS DE LA VENTANA PARA LA SEÑAL SCR

[nbPeaks, ampPeaks, riseTime, recoveryTime, aup, stdSCR, posPeaks, GSR_phasic] = Signal_feat_SCR(signal);

feature(i) = nbPeaks;
i = i + 1;

%NUMERO DE PICOS POR SEGUNDO SCR

[nbpeaks_seg,amp_sum,response_sum,aup_sum] = Signal_feat_window_SCR(signal, 8);

feature(i) = nbpeaks_seg;
i = i + 1;

%SUMATORIO DE AMPLITUD SCR

feature(i) = amp_sum;
i = i + 1;

%SUMATORIO TIEMPO DE RESPUESTA SCR

feature(i) = response_sum;
i = i + 1;

%SUMATORIO DE AREAS 

feature(i) = aup_sum;

end

