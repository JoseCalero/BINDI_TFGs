%Cargamos la señal a la que le vamos a hacer el test

load ('GSRsignal_test.mat');

%% MEDIA PARA LA VENTANA

mean = Signal_feat_mean (GSRsignal_test);

%% DESVIACION DE LA VENTANA

std = Signal_feat_std(GSRsignal_test);

%% MINIMO DE LA VENTANA

min = Signal_feat_min(GSRsignal_test);

%% MAXIMO DE LA VENTANA

max = Signal_feat_max(GSRsignal_test);

%% RANGO DE LA VENTANA

range = Signal_feat_range(GSRsignal_test);

%% SLOPE DE LA VENTANA

slope = Signal_feat_slope(GSRsignal_test);

%% MEDIA DE LA VENTANA PARA LA SEÑAL SCL

GSR_tonic = GSR_get_SCL(GSRsignal_test);
mean_SCL = Signal_feat_mean (GSR_tonic);

%% DESVIACION DE LA VENTANA PARA LA SEÑAL SCL

std_SCL = Signal_feat_std(GSR_tonic);

%% CORRELACION DE LA VENTANA 

correlation = Signal_feat_correlation(GSRsignal_test);

%% DESVIACION DE LA VENTANA PARA LA SEÑAL SCR

GSR_phasic = GSR_get_SCR (GSRsignal_test);
std_SCR = Signal_feat_std (GSR_phasic);

%% NUMERO DE PICOS DE LA VENTANA PARA LA SEÑAL SCR

[nbPeaks, ampPeaks, riseTime, recoveryTime, aup, stdSCR, posPeaks, GSR_phasic] = Signal_feat_SCR(GSRsignal_test);
 
%% NUMERO DE PICOS POR SEGUNDO SCR, SUMATORIO DE AMPLITUD SCR, SUMATORIO TIEMPO DE RESPUESTA SCR 

[nbpeaks_seg,amp_sum,response_sum] = Signal_feat_window_SCR(GSRsignal_test, 8);