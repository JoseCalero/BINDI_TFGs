
%Filtro para obtener la señal fásica, correspondiente al SCR.

function Signal = Signal_filter_low_median(Signal, windowSize)

filtered = smooth(raw, windowSize);

Signal.raw = double(filtered);

%Indicate that the signal has been filtered
Signal.preprocessing.('lowpass') = true;

