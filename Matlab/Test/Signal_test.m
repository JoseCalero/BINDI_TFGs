%%Vamos a extraer una ventana de la se�al GSR para utilizarla en los test

%Cargamos el directorio donde se encuentran alojados nuestros datos
cd;
folder_WESAD = cd('/Users/walalay/Desktop/TFG/WESAD');
s = 3;
subject_string = int2str(s);
     path = strcat('S',subject_string);
     cd(path);
     load ('out.mat');
     
     %Establecemos el tiempo de la ventana
     time = 8;
     
     %Cargamos la se�al
     GSRsignal = signal.wrist.EDA;
     
     %Dividimos la se�al en ventanas
     window = Window(GSRsignal, time);
     
     GSRsignal_test = GSRsignal(window(1):(window(2)-1));
     
     %Sacamos la traspuesta de la se�al
     GSRsignal_test = GSRsignal_test';