function [numero_de_pulso, pulsos_totales] = variables_aux(signal_wrist_BVP, a, b)

pulsos_totales = 0;
N = 1;

for n = a+30:b-31
    if (signal_wrist_BVP(n) > signal_wrist_BVP(n-1) && signal_wrist_BVP(n) > signal_wrist_BVP(n+1))
        ok = 0;
        for aux = 1:30 % Comparo si es el máx que estoy buscando con los máx relativos cercanos
            if signal_wrist_BVP(n) > signal_wrist_BVP(n+aux) && signal_wrist_BVP(n) > signal_wrist_BVP(n-aux)
                ok = ok + 1;
            end
        end
        if ok == 30
            pulsos_totales = pulsos_totales + 1;
            numero_de_pulso(N) = n;
            N = N + 1;
        end 
    end
end

end