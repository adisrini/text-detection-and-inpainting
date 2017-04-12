function mask = detect_edges( filename )

I = rgb2gray(imread(strcat('../inputs/', filename)));
BW1 = edge(I, 'Prewitt');
SE = strel('square',3);
BW2 = imdilate(BW1, SE);
% figure;
% imshow(BW2);
% figure;
% imshowpair(BW1, BW2, 'montage');
imwrite(BW2, strcat('../masks/',filename));

mask = BW2;

end

