
%Cargamos el directorio donde se encuentran alojados nuestros datos
cd;
folder_WESAD = cd('/Users/walalay/Desktop/TFG/WESAD');

%Definimos las estructuras a usar
data_GSRsignal = struct([]);
data_filtered_GSR = struct([]);
data_SCRsignal = struct([]);

%Variable correspondiente al sujeto del que vamos a extraer las
%características (S2 a S17) en total 15 sujetos
s = 1;

%Basándonos en el label identificamos los diversos estados emocionales
%inducidos
%baseline = find(label==1) ;
%stress = find (label==2) ;
%meditation = find (label==4) ;
%amusement = find (label==3) ;


for n = 1 : 15
    
     %Incrementamos el número de sujeto para cambiar de tabla
     s = s + 1;
    
     folder_WESAD = cd('/Users/walalay/Desktop/TFG/WESAD');
     if (s==12)
       s = s + 1;
     end

     subject_string = int2str(s);
     path = strcat('S',subject_string);
     cd(path);
     load ('out.mat');

     %Cargamos la señal que vamos a querer usar
     GSRsignal = signal.wrist.EDA;

     %Establecemos el tiempo de la ventana
     time = 8;

     %Dividimos la señal en ventanas
     window = Window(GSRsignal, time);
     
     %Posición de la tabla que recorremos para la tabla filtrada
     k = 1;
     for i = 1 : length(window)-1

        %Cargamos las características
        features = Window_Feature_Extraction(GSRsignal, window, i);

        %Almacenamos las características en la tabla
        for j = 1 : length (features)

            data_GSRsignal(n).features(i,j) = features (j);

        end
        
        %Label correspondiente a cada ventana
        data_GSRsignal(n).features(i,length (features)+1) = label(round((700/4)*window(i)));
     
        if (data_GSRsignal(n).features(i,length(features)+1)==1 || data_GSRsignal(n).features(i,length(features)+1)==2 || data_GSRsignal(n).features(i,length(features)+1)==3 || data_GSRsignal(n).features(i,length(features)+1)==4)
            
            for j = 1 : length(features)+1
                
                data_filtered_GSR(n).features(k,j) = data_GSRsignal(n).features(i,j);
                
            end
            k = k + 1;
        end
        
     end

     %Calculamos las características correspondientes a la señal SCR

     [nbPeaks, ampPeaks, riseTime, recoveryTime, aup, stdSCR, posPeaks, GSR_phasic] = Signal_feat_SCR(GSRsignal);


     %Almacenamos las características de la señal SCR en la tabla
     %correspondiente
      
     for i = 1 : nbPeaks

        data_SCRsignal(n).features(i,1) = ampPeaks(i);
        data_SCRsignal(n).features(i,2) = riseTime(i);
        data_SCRsignal(n).features(i,3) = recoveryTime(i);
        data_SCRsignal(n).features(i,4) = aup(i);
        data_SCRsignal(n).features(i,5) = posPeaks(i);
        %Label correspondiente a cada pico
        data_SCRsignal(n).features(i,6) = label(round((700/4)*posPeaks(i)));
        
     end       
    
end