function mean = Signal_feat_mean(Signal)

suma = 0;

for n=1 : length(Signal)
    
    suma = suma + Signal(n);  
end

mean = suma/length(Signal);

end

