%Cargamos el directorio donde se encuentran alojados nuestros datos
cd;
folder_WESAD = cd('/Users/walalay/Desktop/TFG/WESAD');

%Definimos las estructuras a usar
data_label_GSRsignal = struct([]);
data_label_SCRsignal = struct([]);

%Variable correspondiente al sujeto del que vamos a extraer las
%características (S2 a S17) en total 15 sujetos
s = 1;

%Recorremos todos los sujetos
for n = 1 : 15
    
    %Incrementamos el número de sujeto para cambiar de tabla
    s = s + 1;
    
    folder_WESAD = cd('/Users/walalay/Desktop/TFG/WESAD');
    
    %Como no existe el sujeto S12 deberemos saltárnoslo
    if (s==12)
       s = s + 1;
    end

     subject_string = int2str(s);
     path = strcat('S',subject_string);
     cd(path);
     load ('out.mat');
     
    %Primera etapa: baseline
    %Cargamos las señales que vamos a usar,
    %la secuencia que se va a utilizar será: baseline, stress, medi1,
    %amusement, medi2.
    %Basándonos en el label identificamos los diversos estados emocionales
    %inducidos
    
    baseline = find(label==1);
    stress = find(label==2);
    meditation = find(label==4);
    amusement = find(label==3);
    
    m = 1;
    while (meditation(m+1) - meditation(m) == 1)
        
        m = m + 1;
        
    end
    m = m + 1;
    
    GSRsignal_baseline = signal.wrist.EDA(round((4/700)*baseline(1)):round((4/700)*baseline(end)));
    GSRsignal_amusement = signal.wrist.EDA(round((4/700)*amusement(1)):round((4/700)*amusement(end)));
    GSRsignal_stress = signal.wrist.EDA(round((4/700)*stress(1)):round((4/700)*stress(end)));
    GSRsignal_medi1 = signal.wrist.EDA(round((4/700)*meditation(1)):round((4/700)*meditation(m)));
    GSRsignal_medi2 = signal.wrist.EDA(round((4/700)*meditation(m+1)):round((4/700)*meditation(end)));
     
     
     %% BASELINE
     %Cargamos las características
     features = Signal_Feature_Extraction(GSRsignal_baseline);

     %Almacenamos las características en la tabla
     for j = 1 : length (features)
 
         data_label_GSRsignal(n).features(1,j) = features (j);

     end
        
     %Label correspondiente
     data_label_GSRsignal(n).features(1,length (features)+1) = 1;
     
     %% STRESS
     %Cargamos las características
     features = Signal_Feature_Extraction(GSRsignal_stress);

     %Almacenamos las características en la tabla
     for j = 1 : length (features)
 
         data_label_GSRsignal(n).features(2,j) = features (j);

     end
        
     %Label correspondiente
     data_label_GSRsignal(n).features(2,length (features)+1) = 2;
     
     %% MEDI 1
     
     %Cargamos las características
     features = Signal_Feature_Extraction(GSRsignal_medi1);

     %Almacenamos las características en la tabla
     for j = 1 : length (features)
 
         data_label_GSRsignal(n).features(3,j) = features (j);

     end
        
    %Label correspondiente
     data_label_GSRsignal(n).features(3,length (features)+1) = 4.1;
     
     %% AMUSEMENT
     
     %Cargamos las características
     features = Signal_Feature_Extraction(GSRsignal_amusement);

     %Almacenamos las características en la tabla
     for j = 1 : length (features)
 
         data_label_GSRsignal(n).features(4,j) = features (j);

     end
        
     %Label correspondiente
     data_label_GSRsignal(n).features(4,length (features)+1) = 3;
     
     %% MEDI 2
     
     %Cargamos las características
     features = Signal_Feature_Extraction(GSRsignal_medi2);

     %Almacenamos las características en la tabla
     for j = 1 : length (features)
 
         data_label_GSRsignal(n).features(5,j) = features (j);

     end
        
     %Label correspondiente
     data_label_GSRsignal(n).features(5,length (features)+1) = 4.2;


     %% Calculamos las características correspondientes a la señal SCR

     GSRsignal = signal.wrist.EDA;
     [nbPeaks, ampPeaks, riseTime, recoveryTime, aup, stdSCR, posPeaks, GSR_phasic] = Signal_feat_SCR(GSRsignal);


     %Almacenamos las características de la señal SCR en la tabla
     %correspondiente solamente si se corresponden con un label de 1,2,3 o
     %4
     
     k = 1;
     
     for i = 1 : nbPeaks
         
        label_value = label(round((700/4)*posPeaks(i))); 
        
        if (label_value == 1 || label_value == 2 || label_value == 3 || label_value == 4)
        data_label_SCRsignal(n).features(k,1) = ampPeaks(i);
        data_label_SCRsignal(n).features(k,2) = riseTime(i);
        data_label_SCRsignal(n).features(k,3) = recoveryTime(i);
        data_label_SCRsignal(n).features(k,4) = aup(i);
        data_label_SCRsignal(n).features(k,5) = posPeaks(i);
        %Label correspondiente a cada pico
        data_label_SCRsignal(n).features(k,6) = label(round((700/4)*posPeaks(i)));
        
        k = k + 1;
        end
     end       
end