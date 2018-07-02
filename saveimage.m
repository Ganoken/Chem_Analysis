%Just save the images obtain from FindPeakImage

load('I:/ch0618/output/peak_image_off.mat') % Set input file
load('I:/ch0618/output/peak_image_off_mean.mat')
NImage = size(PeakImage,3);
%PPSPF = ;
%skip = NImage/PPSPF;
for j=1:NImage
    imshow(PeakImage(:,:,j),[0 3000])
    FileName = ['I:/ch0618/output/peakimage/off/try2/Peak' num2str(j,'%02u') '.jpg']; % set outputfile
    saveas(gcf,FileName)
end

imshow(PeakImageMean(:,:,1),[0 2000])
FileName = ['I:/ch0618/output/peakimage/off/try2/PeakMean2.jpg']; % set outputfile
saveas(gcf,FileName)