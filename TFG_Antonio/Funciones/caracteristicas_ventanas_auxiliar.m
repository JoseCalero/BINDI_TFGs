%% FUNCION QUE IMPRIME VENTANA X VENTANA
%

clear
clc

cd('C:\Users\AAS\Documents\UC3M\4o Curso\TFG\2a tarea 07-02-2020\WESAD\S10');

load('out.mat');

cd('C:\Users\AAS\Documents\GitHub\BINDI_TFGs\TFG_Antonio\Funciones');

%%  Ventana n a muestrear
%
%

n = 1:74;
ventanas = Ventanas_16s(signal.wrist.BVP);


%% CALCULO DE CARACTERISTICAS
%
%
[caracteristica, HRV, vector_pos] = calculo_caracteristicas_Tdomain(n, ventanas, signal.wrist.BVP);
caracteristica2 = calculo_caracteristicas_Fdomain(HRV, vector_pos);
rqa = no_lineales(n, ventanas, signal.wrist.BVP);

%% Ventanas temporales de nuestra señal
%
%
ventanas = Ventanas_16s(signal.wrist.BVP);


%% FUNCION FINAL DE MUESTREO DE VENTANA
%
%
plot_ventana(ventanas, signal.wrist.BVP, n, caracteristica);
