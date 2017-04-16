function [ shrunk ] = image_shrink( I )

width = max(size(I,1),size(I,2));
ideal_width = 400;
shrink_factor = ideal_width/width;
shrunk = imresize(I,shrink_factor);

end

