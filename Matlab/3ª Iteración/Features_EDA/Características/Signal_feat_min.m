function min = Signal_feat_min(signal)

min = signal(1) ;

for n=1: length(signal)
    if (signal(n) < min)
        min = signal(n) ;
    end
end

end

