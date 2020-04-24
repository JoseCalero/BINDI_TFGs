
%Filtro para obtener la se�al f�sica, correspondiente al SCR.

function Signal = Signal_filter_low_median(Signal, windowSize)

filtered = smooth(raw, windowSize);

Signal.raw = double(filtered);

%Indicate that the signal has been filtered
Signal.preprocessing.('lowpass') = true;

