function [ mask ] = color_select_mask(filename, R, G, B)

I = imread(strcat('../inputs/',filename));
rows = size(I,1);
cols = size(I,2);

mask = zeros(rows,cols);
padding = 85;
thicc = 10;

for r = 1:1:rows
   for c = 1:1:size(I,2)
       IR = I(r,c,1);
       IG = I(r,c,2);
       IB = I(r,c,3);
       R_close = IR <= (R + padding) && IR >= (R - padding);
       G_close = IG <= (G + padding) && IG >= (G - padding);
       B_close = IB <= (B + padding) && IB >= (B - padding);
       
       if ( R_close && G_close && B_close )
           mask(r,c) = 1;
           for outline = 1:thicc
               for offset = 0:outline
                   mask(r+outline,c+offset) = 1;
                   mask(r-outline,c+offset) = 1;
                   mask(r+offset,c+outline) = 1;
                   mask(r+offset,c-outline) = 1;
                   mask(r+outline,c-offset) = 1;
                   mask(r-outline,c-offset) = 1;
                   mask(r-offset,c+outline) = 1;
                   mask(r-offset,c-outline) = 1;
               end
           end
       end
   end
end


imwrite(mask, strcat('../masks/',filename));

end

