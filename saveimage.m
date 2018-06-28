%Just save the images obtain from FindPeakImage

load('G:/ch0618/output/peak_image_50.mat') % Set input file

NImage = size(PeakImage,3);
PPSPF = ;
skip = NImage/PPSPF;
for j=1:skip:NImage
    imshow(PeakImage(:,:,j),[0 3000])
    FileName = ['G:/ch0618/output/peakimage/50/p1/Peak' num2str(j,'%02u') '.jpg']; % set outputfile
    saveas(gcf,FileName)
end