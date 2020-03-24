%% FUNCION QUE IMPRIME VENTANA X VENTANA
%

cd('C:\Users\AAS\Documents\UC3M\4o Curso\TFG\2a tarea 07-02-2020\WESAD\S2');

load('out.mat');

cd('C:\Users\AAS\Documents\UC3M\4o Curso\TFG\2a tarea 07-02-2020\WESAD');

%%  Ventana n a muestrear
%
%
n = 340;
ventanas = Ventanas_8s(signal.wrist.BVP);


%% CALCULO DE CARACTERISTICAS
%
%
caracteristica = calculo_caracteristicas_Tdomain(n, ventanas, signal.wrist.BVP);


%% Ventanas temporales de nuestra señal
%
%
ventanas = Ventanas_8s(signal.wrist.BVP);


%% FUNCION FINAL DE MUESTREO DE VENTANA
%
%
plot_ventana(ventanas, signal.wrist.BVP, n, caracteristica);

