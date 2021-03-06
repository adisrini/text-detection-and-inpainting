%% Deprecated with New GUI: see otsu_threshold


I = imread('../inputs/swan.jpg');
I = im2double(I(:, :, :));
HSV = rgb2hsv(I);
H = HSV(:,:,1); H = H(:);
S = HSV(:,:,2); S = S(:);
V = HSV(:,:,3); V = V(:);
idx = kmeans([H S V], 2);
Iotsu = reshape(idx, size(I,1), size(I, 2));
SE = strel('square', 2);
BW = ind2rgb(imdilate(Iotsu, SE), [0 0 0; 1 1 1]);
imwrite(BW, '../masks/swan.jpg');