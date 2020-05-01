function [nbpeaks_seg,amp_sum,response_sum,aup_sum] = Signal_feat_window_SCR(GSRsignal, time)

[nbPeaks, ampPeaks, riseTime, recoveryTime, aup, stdSCR, posPeaks, GSR_phasic] = Signal_feat_SCR(GSRsignal)

nbpeaks_seg = nbPeaks/time;
amp_sum = 0;
response_sum = 0;
aup_sum = 0;

for i = 1 : nbPeaks
    
    amp_sum = amp_sum + ampPeaks(i);
    response_sum = response_sum + recoveryTime(i);
    aup_sum = aup_sum + aup(i);
    
end

end

