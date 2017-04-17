function mask = detect_edges( filename, edge_thickness )

I = rgb2gray(imread(strcat('../inputs/', filename)));
BW1 = edge(I, 'Prewitt');
SE = strel('square', edge_thickness);
BW2 = imdilate(BW1, SE);
imwrite(BW2, strcat('../masks/',filename));
mask = BW2;

end

