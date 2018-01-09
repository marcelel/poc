close all; clearvars; clc;

shapes = imread('shapes.png');
[XX, YY] = size(shapes);
shapes = bwlabel(shapes, 4);
wsp = obliczWspolczynniki(shapes);

for i = 1:XX
   for j = 1:YY
       piksel = shapes(i, j);
       if (piksel ~= 0 && ~(wsp(piksel, 2) > 0.33 && wsp(piksel, 2) < 0.66))
            shapes(i, j) = 0;
       end
   end
end

figure;
imshow(shapes,[]);

shapesReal = imread('shapesReal.png');
shapesReal = bwlabel(imerode(imcomplement(im2bw(shapesReal, 0.23)), strel('square', 5)), 4);
[XXr, YYr] = size(shapesReal);
wspReal = obliczWspolczynniki(shapesReal);

for i = 1:XXr
   for j = 1:YYr
       piksel = shapesReal(i,j);
       if (piksel ~= 0 && ~(wspReal(piksel, 2) > 0.33 && wspReal(piksel, 2) < 0.66))
            shapesReal(i,j) = 0;
       end
   end
end

figure;
imshow(shapesReal,[]);