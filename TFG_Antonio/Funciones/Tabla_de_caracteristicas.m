%% SCRIPT QUE RECOGE Y GUARDA EN UNA TABLA 3D LAS CARACTERISTICAS
%
% La primera dimensión son las filas: valor de las caracteristicas
% La segunda dimensión son las columnas: característica en cuestión
% La tercera dimensión es el número de la tabla bidimensional: nº paciente
%
% Abrimos la dirección donde se encuentran nuestros archivos y guardamos en
% un vector todos los nombres de los archivos de esta carpeta
%

clear
clc

cd;
carpeta_archivos = cd('C:\Users\AAS\Documents\UC3M\4o Curso\TFG\2a tarea 07-02-2020\WESAD');

if strcmp(carpeta_archivos,cd)==1
else
    carpeta_archivos = cd('C:\Users\AAS\Documents\UC3M\4o Curso\TFG\2a tarea 07-02-2020\WESAD');
end

archivos = ls(carpeta_archivos); 


%% LEEMOS Y ALMACENAMOS PACIENTE A PACIENTE DEL EXPERIMENTO DE WESAD
%

data = struct([]);
sujeto = 0;

for i = 1:length(archivos) 
    
    %
    % Encontramos un archivo que empieza por S 
    %
    if(strcmp(archivos(i),'S') == 1)
       
        sujeto = sujeto + 1;
        
        cd('C:\Users\AAS\Documents\UC3M\4o Curso\TFG\2a tarea 07-02-2020\WESAD');
        archivo = cd(archivos(i,:));
            
        %
        % Señal del paciente encontrado y self-reports (Valence - Arousal)
        %
        
        load('out.mat');
        load('valence_arousal');
        
        %
        % Volvemos a la carpeta de archivos inicial
        %
        
        cd('C:\Users\AAS\Documents\GitHub\BINDI_TFGs\TFG_Antonio\Funciones');
        
        %
        % N de ventanas temporales de la señal escogida
        %
        
        ventanas = Ventanas_8s(signal.wrist.BVP);
        
        [VA, b, s, m1, a, m2] = valence_arousal(label, valence, arousal);
        
        %
        % Muestreamos ventana por ventana en una figura características
        %
        for j = 1:length(ventanas)-1
            
            caracteristica_T = calculo_caracteristicas_Tdomain(j, ventanas, signal.wrist.BVP);
            caracteristica_F = calculo_caracteristicas_Fdomain(j, ventanas, signal.wrist.BVP);
            label_sujeto = get_label(j, ventanas, VA, b, s, m1, a, m2);
            
            %
            % No puedo hacer un plot con este método de ejecución, el
            % tiempo de ejecución del programa es ~ 1h
            %
            
            if caracteristica_T ~= 0 % No me funsiona
                
                %
                %Características en Tdomain
                %
                
                data{sujeto}.features(j,1) = caracteristica_T(1);
                data{sujeto}.features(j,2) = caracteristica_T(2);
                data{sujeto}.features(j,3) = caracteristica_T(3);
                data{sujeto}.features(j,4) = caracteristica_T(4);
                data{sujeto}.features(j,5) = caracteristica_T(5);
                data{sujeto}.features(j,6) = caracteristica_T(6);
                data{sujeto}.features(j,7) = caracteristica_T(7);
                data{sujeto}.features(j,8) = caracteristica_T(8);
                
                %
                % Características en Fdomain
                %
                
                data{sujeto}.features(j,9) = caracteristica_F(1);
                data{sujeto}.features(j,10) = caracteristica_F(2);
                data{sujeto}.features(j,11) = caracteristica_F(3);
                data{sujeto}.features(j,12) = caracteristica_F(4);
                data{sujeto}.features(j,13) = caracteristica_F(5);
                data{sujeto}.features(j,14) = caracteristica_F(6);
                data{sujeto}.features(j,15) = caracteristica_F(7);
                data{sujeto}.features(j,16) = caracteristica_F(8);
                %data{sujeto}.features(j,17) = caracteristica_F(9);
                
                %
                % Label de self-report asociado a dicha ventana
                %
                
                data{sujeto}.features(j,17) = label_sujeto;
                
            end
        end
    end 
end
