% Recogemos las posiciones de las ventanas de 16s - difieren 1024 muestras
% respecto a la señal signal.wrist.BVP a 64 Hz

function ventanas16 = Ventanas_16s(signal_wrist_BVP)

n = 1;
for i = 1:1024:length(signal_wrist_BVP)
    ventanas16(n) = i;
    n = n + 1;
end

end