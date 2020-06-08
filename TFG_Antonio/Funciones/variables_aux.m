function [numero_de_pulso, pulsos_totales] = variables_aux(signal_wrist_BVP, a, b)

pulsos_totales = 0;
primer_paso_x_cero = 0;
segundo_paso_x_cero = 0;
M = 1;

for n = a:b
    if signal_wrist_BVP(n) < 0 && signal_wrist_BVP(n+1) > 0 
        primer_paso_x_cero = n;
    elseif (signal_wrist_BVP(n) > 0 && signal_wrist_BVP(n+1) < 0) && primer_paso_x_cero ~= 0
        
        segundo_paso_x_cero = n;
        N = 1;
        
        for i = primer_paso_x_cero+1:segundo_paso_x_cero
            if (signal_wrist_BVP(i) > signal_wrist_BVP(i-1)) && (signal_wrist_BVP(i) >= signal_wrist_BVP(i+1))
                mayores(N) = signal_wrist_BVP(i);
                num_pulso(N) = i;
                N = N + 1;
            end
        end
        
        mayor = mayores(1);
        pulso_mayor = num_pulso(1);
        
        for i = 1:N-1
            if mayor < mayores(i)
                mayor = mayores(i);
                pulso_mayor = num_pulso(i);
            end
        end
        
        pulsos_totales = pulsos_totales + 1;
        numero_de_pulso(M) = pulso_mayor;
        M = M + 1;
        
        primer_paso_x_cero = 0;
        segundo_paso_x_cero = 0;
        
    end
    
end

end