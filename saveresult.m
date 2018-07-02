load('I:/ch0618/PM/chem_50_mean_nor.mat') % Set input file
V = 0.0:0.1:1.0;
%X = 480:800;
%Y = 400:700;
for n=1:32
%    contourf(X,Y,MeanImage(:,:,n),V)
  %  contourf(flipud(MeanImage(:,:,n),V))
    contourf(flipud(PhaseMeanImage(:,:,n)),V)
    set(gca, 'FontName','Times','FontSize',24 );
    caxis([0 1]);
    axis off;
    colormap jet
    %colorbar ('TickLabels', {'0.0', '0.1', '0.2', '0.3', '0.4', '0.5', '0.6', '0.7', '0.8', '0.9', '1.0'});
    colorbar
    FileName = ['I:/ch0618/PM/Image/jpg/50/Phase' num2str(n,'%02u') '.jpg']; % set outputfile
    saveas(gcf,FileName)
end