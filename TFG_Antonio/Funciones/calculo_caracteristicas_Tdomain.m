%% CALCULO DE CARACTERISTICAS PARA UNA VENTANA

function caracteristica = calculo_caracteristicas_Tdomain(n, ventanas, signal_wrist_BVP)
%% VARIABLES AUXILIARES PARA LA OBTENCIÓN DE CARACTERÍSTICAS
%
%
[numero_de_pulso, pulsos_totales] = variables_aux(signal_wrist_BVP, ventanas(n), ventanas(n+1)); 


%% HR = 60 / P-P interval - RESPECTO AL TOTAL DE LA VENTANA
%
%
HR_mean = media_HR(pulsos_totales, numero_de_pulso);
caracteristica(1) = HR_mean;

HR_std = desviacion_HR(HR_mean, pulsos_totales, numero_de_pulso);
caracteristica(2) = HR_std;


%% HRV: Time interval between heartbeats
%
%
HRV_mean = media_HRV(pulsos_totales, numero_de_pulso);
caracteristica(3) = HRV_mean;

HRV_std = desviacion_HRV(HRV_mean, pulsos_totales, numero_de_pulso);
caracteristica(4) = HRV_std;


%% HRV_RMS
%
%
HRV_rms = rms_HRV(pulsos_totales, numero_de_pulso);
caracteristica(5) = HRV_rms;


%% NÚMERO DE PULSOS Y PORCENTAJE DE AQUELLOS SUPERIORES A 50 ms
%
%
[NN50, pNN50] = NN50_BVP(pulsos_totales, numero_de_pulso);
caracteristica(6) = NN50;
caracteristica(7) = pNN50;


%% TINN
% Hay que guardar en un vector los datos de tiempos
% y en otro el número de veces que éstos se repiten

%TINN = TINN_funct(pulsos_totales, numero_de_pulso);
%caracteristica(8) = TINN;

end
