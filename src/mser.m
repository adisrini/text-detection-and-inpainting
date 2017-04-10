%Text recognition and creating the mask mser

i = imread('../inputs/face.jpg');
I = imadjust(rgb2gray(i),[0.0; .7],[])
%figure 
%imshow(I);
regions = detectMSERFeatures(I,'MaxAreaVariation', .1, 'ThresholdDelta', 5);
figure; 
imshow(I); hold on;
plot(regions,'showPixelList',true,'showEllipses',false);