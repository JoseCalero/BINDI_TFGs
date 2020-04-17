% Función para la extracción de características no lineales

function rqa = no_lineales(n, ventanas, signal)

      % Determining embedding dimension m and time lag (delay time) t
      % EQ1
      signal_ventana = signal(ventanas(n)):signal(ventanas(n+1));
      [y,~,~]=phaseSpaceReconstruction(signal_ventana,'MaxLag',500);

      % Color recurrence plot
      % cerecurr_y(y);
      % EQ2
      recurdata = cerecurr_y(y);
      
      % S. Schinkel, O. Dimigen, and N. Marwan, “Selection of Recurrence
      % Threshold for Signal Detection,” The European Physical J.-Special
      % Topics, vol. 164, no. 1, pp. 45-53, 2008
      e_thr = 0.1*mean(mean(recurdata));

      % black-white recurrence plot
      % tdrecurr_y(recurdata,e_thr);
      % EQ3
      recurrpt = tdrecurr_y(recurdata,e_thr);

      % Recurrence quantification analysis
      % rqa_stat - RQA statistics - [recrate DET LMAX ENT LAM TT]
      rqa = recurrqa_y(recurrpt);
      % [rrate,det,lmax,ent,lam,tt]
      % rrate = rqa(1);
      % det = rqa(2);
      % lmax = rqa(3);
      % ent = rqa(4);
      % lam = rqa(5);
      % tt = rqa(6);

end