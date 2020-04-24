%Función para obtener las distintas ventanas. Tenemos una frecuencia de
%muestreo de 4Hz, esto nos da un recorrido de la señal de 32 muestras por
%ventana. Avanzamos en ventanas que toman 32 muestras SIN SOLAPAMIENTO.

function window = Window(signal, time)

frequency = 4;
window_length = time*frequency;

n = 1;
    for i = 1:window_length:length(signal)
    window(n)= i;
    n = n+1;
    end
end

