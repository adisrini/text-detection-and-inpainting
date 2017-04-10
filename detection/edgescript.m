%edges

I = rgb2gray(imread('test.jpg'));
BW1 = edge(I, 'Prewitt');
BW2 = edge(I, 'Roberts');
figure;
imshowpair(BW1, BW2, 'montage');