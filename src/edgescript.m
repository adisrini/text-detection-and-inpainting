%% Deprecated with New GUI

%edges

I = rgb2gray(imread('../inputs/mountain.jpg'));
h = fspecial('average', [3, 5]);
I2 = filter2(h, I);
BW1 = edge(I2, 'Prewitt');
SE = strel('square', 1);
BW2 = imdilate(BW1, SE);
figure;
imshowpair(BW1, edge(I, 'Prewitt'), 'montage');