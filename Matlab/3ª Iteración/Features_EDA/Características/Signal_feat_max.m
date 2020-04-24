function max = Signal_feat_max(Signal)

max = Signal(1) ;

for n=1: length(Signal)
    if (Signal(n) > max)
        max = Signal(n) ;
    end
end

end

