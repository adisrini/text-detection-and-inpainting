%edges

I = rgb2gray(imread('../inputs/turtle2.png'));
BW1 = edge(I, 'Prewitt');
SE = strel('square',3);
BW2 = imdilate(BW1, SE);
% figure;
% imshow(BW2);
% figure;
% imshowpair(BW1, BW2, 'montage');
imwrite(BW2, '../masks/turtle2.jpg');