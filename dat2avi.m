%20180604 Sujoy
% just to make movie


%Set parameters
X_Pixels = 768;
Y_Pixels = 768;
Number_Image = 1000; %Total # of image per file
Pixels = X_Pixels*Y_Pixels; % # of total pixels/image
BatchSize = 100; % # of image to process @one time determine based on memory size
N = [X_Pixels Y_Pixels BatchSize]; % structure of input data
BatchCount = Number_Image/BatchSize; % number of division per file
Number_File = 1; % # of file to analyze
filename = sprintf('E:/chem_analysis/chem_11_cor.dat');
directoryname='E:/chem_analysis/video/';
outputVideo = VideoWriter(fullfile(directoryname,'offHz5.avi'));
outputVideo.FrameRate = 50;
open(outputVideo);

for j = 1:Number_Image
    Image = reshape(loaddat(filename,(j-1)*Pixels*2,Pixels),[Y_Pixels,X_Pixels,1]); %load the image
    RawImage = permute(Image,[2 1])/max(max(max(Image,[],3))); %permute
    %Image = RawImage/max(max(max(RawImage,[],3)));
    writeVideo(outputVideo,RawImage);
    
    
end
 
 close(outputVideo);
 