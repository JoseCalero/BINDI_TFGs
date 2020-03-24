%% SCRIPT QUE RECOGE Y GUARDA EN UNA TABLA 3D LAS CARACTERISTICAS
%
% La primera dimensión son las filas: valor de las caracteristicas
% La segunda dimensión son las columnas: característica en cuestión
% La tercera dimensión es el número de la tabla bidimensional: nº paciente
%
% Abrimos la dirección donde se encuentran nuestros archivos y guardamos en
% un vector todos los nombres de los archivos de esta carpeta
%

cd;
carpeta_archivos = cd('C:\Users\AAS\Documents\UC3M\4o Curso\TFG\2a tarea 07-02-2020\WESAD');

if strcmp(carpeta_archivos,cd)==1
else
    carpeta_archivos = cd('C:\Users\AAS\Documents\UC3M\4o Curso\TFG\2a tarea 07-02-2020\WESAD');
end

archivos = ls(carpeta_archivos); 


%% LEEMOS Y ALMACENAMOS PACIENTE A PACIENTE DEL EXPERIMENTO DE WESAD
%
tabla_caracteristicas = [];
sujeto = 0;

for i = 1:length(archivos) 
    
    %
    % Encontramos un archivo que empieza por S 
    %
    if(strcmp(archivos(i),'S') == 1)
       
        sujeto = sujeto + 1;
        
        archivo = cd(archivos(i,:));
            
        %
        % Señal del paciente encontrado y self-reports (Valence - Arousal)
        %
        
        load('out.mat');
        load('valence_arousal');
        
        %
        % Volvemos a la carpeta de archivos inicial
        %
        
        carpeta_archivos = cd('C:\Users\AAS\Documents\UC3M\4o Curso\TFG\2a tarea 07-02-2020\WESAD');
        
        %
        % N de ventanas temporales de la señal escogida
        %
        
        ventanas = Ventanas_8s(signal.wrist.BVP);
        
        %
        % Muestreamos ventana por ventana en una figura características
        %
        for j = 1:length(ventanas)-1
            
            caracteristica_T = calculo_caracteristicas_Tdomain(j, ventanas, signal.wrist.BVP);
            %caracteristica_F = calculo_caracteristicas_Fdomain(j, ventanas, signal.wrist.BVP);
            
            %
            % No puedo hacer un plot con este método de ejecución, el
            % tiempo de ejecución del programa es ~ 1h
            %
            
            if caracteristica_T ~= 0 % No me funsiona
                
                %
                %Características en Tdomain
                %
                
                tabla_caracteristicas(j,1,sujeto) = caracteristica_T(1);
                tabla_caracteristicas(j,2,sujeto) = caracteristica_T(2);
                tabla_caracteristicas(j,3,sujeto) = caracteristica_T(3);
                tabla_caracteristicas(j,4,sujeto) = caracteristica_T(4);
                tabla_caracteristicas(j,5,sujeto) = caracteristica_T(5);
                tabla_caracteristicas(j,6,sujeto) = caracteristica_T(6);
                tabla_caracteristicas(j,7,sujeto) = caracteristica_T(7);
                
                %
                % Características en Fdomain
                %
                
                %tabla_caracteristicas(j,8,sujeto) = caracteristica_F(1);
                %tabla_caracteristicas(j,9,sujeto) = caracteristica_F(2);
                %tabla_caracteristicas(j,10,sujeto) = caracteristica_F(3);
                %tabla_caracteristicas(j,11,sujeto) = caracteristica_F(4);
                %tabla_caracteristicas(j,12,sujeto) = caracteristica_F(5);
                %tabla_caracteristicas(j,13,sujeto) = caracteristica_F(6);
                %tabla_caracteristicas(j,14,sujeto) = caracteristica_F(7);
                %tabla_caracteristicas(j,15,sujeto) = caracteristica_F(8);
                %tabla_caracteristicas(j,16,sujeto) = caracteristica_F(9);
                %tabla_caracteristicas(j,17,sujeto) = caracteristica_F(10);
                %tabla_caracteristicas(j,18,sujeto) = caracteristica_F(11);
                
                %
                % Label de self-report asociado a dicha ventana
                %
                
                %tabla_caracteristicas(j,8,sujeto) = get_label(j, ventanas, label);
                
            end
            
            %
            % Me guarda en todos los pacientes el número de ventanas del
            % mayor experimento, en este caso 883 ventanas; los pacientes
            % con menor número de ventanas temporales, las ventanas
            % restantes se rellenan con ceros
            %
            
        end
    end 
end
