%rqa_stat - RQA statistics - [recrate DET LMAX ENT TND LAM TT]

      %Determining embedding dimension m and time lag (delay time) t
      %EQ1
      [y,eLag,eDim]=phaseSpaceReconstruction(raw,'MaxLag',500);
      
      % phase space plot
      %phasespace(raw,eDim,eLag);
      figure('Position',[100 400 460 360]);
      plot3(y(:,1),y(:,2),y(:,3),'-','LineWidth',1);
      title('GSR time-delay embedding - state space plot','FontSize',10,'FontWeight','bold');
      grid on;
      set(gca,'CameraPosition',[25.919 27.36 13.854]);
      xlabel('x(t)','FontSize',10,'FontWeight','bold');
      ylabel('x(t+\tau)','FontSize',10,'FontWeight','bold');
      zlabel('x(t+2\tau)','FontSize',10,'FontWeight','bold');
      set(gca,'LineWidth',2,'FontSize',10,'FontWeight','bold');

      % color recurrence plot
      %cerecurr_y(y);
      %EQ2
      recurdata = cerecurr_y(y);
      %S. Schinkel, O. Dimigen, and N. Marwan, “Selection of Recurrence
      %Threshold for Signal Detection,” The European Physical J.-Special
      %Topics, vol. 164, no. 1, pp. 45-53, 2008
      e_thr=0.1*mean(mean(recurdata));

      %black-white recurrence plot
      %tdrecurr_y(recurdata,e_thr);
      %EQ3
      recurrpt = tdrecurr_y(recurdata,e_thr);

      %Recurrence quantification analysis
      % rqa_stat - RQA statistics - [recrate DET LMAX ENT LAM TT]
      rqa = recurrqa_y(recurrpt);
      %[rrate,det,lmax,ent,lam,tt]
      rrate=rqa(1);
      det=rqa(2);
      lmax=rqa(3);
      ent=rqa(4);
      lam=rqa(5);
      tt=rqa(6);
      
      %Correlation Dimension to calculate D 2.
      %(Note: it is the measure of chaotic signal complexity in multidimensional 
      % phase space and is the slope of the correlation integral versus 
      % the range of radius of similarity)
      corDim=correlationDimension(raw,eLag,eDim,'NumPoints',100)/2;