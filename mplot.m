%

filename = ['I:\ch0618\PM\chem_120_mean_f.mat'];
load(filename);

Part_Mean = mean(mean(MeanImage,1),2);

zeros(1,33);

y(1,1:32)=Part_Mean(1,1,:);
y(1,33)=Part_Mean(1,1,1);

%xticklabels=[0 50 60 70 80 90 100 110 120];
x=0:pi/16:2*pi;
% scrsz=get(groot,'ScreenSize');
% figure('Position', [1 scrsz(2)/3 scrsz(3)/2 scrsz(4)/2]);
%plot(x,y,'-c')
%plot(x,y,'-', 'color', [1 0.5 0]);
%plot(x,y,'-', 'color', [0.6 0.6 0.5]);
plot(x,y, 'color', [0.3 0.6 0.7]);
%daspect([2 14 1])
%daspect([1 1250 1])
% yLim = ([150 250])
% xticklabels=({'0', '50', '60', '70', '80', '90', '100', '110', '120'})
%loglog(ff,pxxf,'-r')
 ax = gca;
   ax.XLim = [0 2*pi];
%      ax.YLim = [190 230];
      ax.XTickMode = 'manual';
%      ax.YTickMode = 'manual';
%      %xtickformat('%.1f')
%      ytickformat('%.1f')
      ax.XTick = 0:pi/4:2*pi;
      %ax.XTickLabel=({'off', '50', '60', '70', '80', '90', '100', '110', '120'});
      ax.XTickLabel=({'0', '1/4\pi', '1/2\pi', '3/4\pi', 'pi', '5/4\pi', '3/2\pi', '7/4\pi', '2\pi'});
     %ax.YTick = 190:20:230;
     ax.FontSize = 24;
     ax.FontName =  'Times New Roman';
     ax.TitleFontSizeMultiplier = 2;
%     %xlabel('\it \fontname{Times New Roman}t \rm[sec]');
%     %ylabel('\it \fontname{Times New Roman}Intensity \rm');
%     %legend('110Hz','Location','NorthEast');