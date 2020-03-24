%% SACANDO DATOS MEDIOS DE LAS CARACTERISTICAS DE LA SEÑAL COMPLETA
%
%
cd;
carpeta_archivos = cd('C:\Users\AAS\Documents\UC3M\4o Curso\TFG\2a tarea 07-02-2020\WESAD');
archivos = ls(carpeta_archivos); 
archivo = cd(archivos(14,:));
load('out.mat');
carpeta_archivos = cd('C:\Users\AAS\Documents\UC3M\4o Curso\TFG\2a tarea 07-02-2020\WESAD');

%% CALCULO DE CARACTERISTICAS Y ALMACENAMIENTO EN VARIABLES NUEVAS
%
%
[NN50, pNN50, HR_mean, HR_std, HRV_mean, HRV_std, HRV_rms] = calculo_caracteristicas_completa(signal.wrist.BVP);

%% GUARDAMOS LAS CARACTERISTICAS EN UNA TABLA
%
% Solo esta implementado para ventanado de 8s

%% FUNCION FINAL DE MUESTRO DE LA SEÑAL
%
%
plot_completa(signal.wrist.BVP, HR_mean, HR_std, HRV_mean, HRV_std, HRV_rms);
