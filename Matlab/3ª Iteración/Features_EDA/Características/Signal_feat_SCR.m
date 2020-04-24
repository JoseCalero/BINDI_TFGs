%CÁLCULO DE LAS CARACTERÍSTICAS DE LA SEÑAL SCR (Skin Conductance Response)

function [nbPeaks, ampPeaks, riseTime, recoveryTime, aup, stdSCR, posPeaks, GSR_phasic] = Signal_feat_SCR(GSRsignal)

%Cogemos ventanas de 4 segundos
tWindowSec = 4;

%Frecuencia de muestreo
samprate = 4;

GSR = GSRsignal;

%Calculamos la mediana de la señal de cada elemento de la señal comparado
%con los restantes pertenecientes a la ventana, cuyo resultado nos da la señal tónica.

GSR_median = movmedian(GSR, [tWindowSec*samprate tWindowSec*samprate]);

GSR_phasic = GSR - GSR_median;

%Obtenemos la desviación

stdSCR = Signal_feat_std(GSR_phasic);

%For each low peaks find it's nearest high peak and check that there is no
%low peak between them, if there is one, reject the peak (OR SEARCH FOR CURVATURE)

%Vector de tiempo de pico
riseTime = []; 

%Vector de tiempo de recuperación de cada pico detectado
recoveryTime = []; 

%Vector de amplitud relativa de cada pico detectado
ampPeaks = []; 

%Vector de amplitud absoluta de cada pico detectado
absAmpPeaks = []; 

%Vector de índices de cada mínimo
posPeaks = []; 

%Area debajo de la SCR (Señal Fásica)
aup=[];        

%uS units (MicroSiemens)
peakOnset_th = 0.01;
peakOffset_th = 0;
onsets=[];
offsets=[];
ctr_peak = 1;
finding_offset = 0;
for i=1:length(GSR)-1 
  %Find peak onset >peakOnset_th (uS)
  if GSR_phasic(i)>peakOnset_th && GSR_phasic(i+1)>GSR_phasic(i) && ~finding_offset
    onsets=[onsets;i];
    last_onset = i;
    finding_offset = 1;
  elseif GSR_phasic(i)<=peakOffset_th
    %Find peak offset ==peakOffset_th
    if length(onsets)>0 && length(offsets)==(length(onsets)-1)
        
      offsets=[offsets;i];
      last_offset = i;
      finding_offset = 0;
      
      %Annotate onset and offset and find peak--> max(GSR)
      peakTimes(ctr_peak,:)=[last_onset, last_offset];
      
      [peak_raw, peak_pos] = max(GSR_phasic(peakTimes(ctr_peak,1):peakTimes(ctr_peak,2)));
      
      aup(ctr_peak)=trapz(GSR_phasic(peakTimes(ctr_peak,1):peakTimes(ctr_peak,2)));
      
      riseTime(ctr_peak)=peak_pos;
      
      recoveryTime(ctr_peak)=(last_offset-last_onset)-peak_pos;
      
      ampPeaks(ctr_peak)=peak_raw-GSR_phasic(peakTimes(ctr_peak,1));
      
      posPeaks(ctr_peak)=peak_pos+last_onset;
      
      absAmpPeaks(ctr_peak)=GSR(posPeaks(ctr_peak));
      
      ctr_peak = ctr_peak + 1;
    end
  end
  
end

nbPeaks = length(ampPeaks);

end


