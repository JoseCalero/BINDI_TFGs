% Recogemos las posiciones de las ventanas de 8s - difieren 512 muestras
% respecto a la señal signal.wrist.BVP a 64 Hz

function ventanas = Ventanas_8s(signal_wrist_BVP)

n = 1;
for i = 1:512:length(signal_wrist_BVP)
    ventanas(n) = i;
    n = n + 1;
end

end