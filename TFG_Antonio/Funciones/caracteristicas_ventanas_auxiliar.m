%% FUNCION QUE IMPRIME VENTANA X VENTANA
%

clear
clc

cd('C:\Users\AAS\Documents\UC3M\4o Curso\TFG\2a tarea 07-02-2020\WESAD\S9');

load('out.mat');

cd('C:\Users\AAS\Documents\GitHub\BINDI_TFGs\TFG_Antonio\Funciones');

%%  Ventana n a muestrear
%
%

n = 200;
ventanas = Ventanas_8s(signal.wrist.BVP);


%% CALCULO DE CARACTERISTICAS
%
%
caracteristica = calculo_caracteristicas_Tdomain(n, ventanas, signal.wrist.BVP);
caracteristica2 = calculo_caracteristicas_Fdomain(n, ventanas, signal.wrist.BVP);


%% Ventanas temporales de nuestra señal
%
%
ventanas = Ventanas_8s(signal.wrist.BVP);


%% FUNCION FINAL DE MUESTREO DE VENTANA
%
%
plot_ventana(ventanas, signal.wrist.BVP, n, caracteristica);

