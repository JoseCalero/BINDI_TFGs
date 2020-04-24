
%Función encargada de realizar el filtrado de la señal.
function signal = filtered_signal(GSRsignal, label)

k = 1;

for i = 1 : length(GSRsignal)
    
    label_value = label(round((700/4)*i));
    
    if (label_value == 1 || label_value == 2 || label_value == 3 || label_value == 4)
        
        signal(k) = GSRsignal(i);
        k = k + 1;
        
    end
    
end

end

