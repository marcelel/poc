close all; clearvars; clc;

ccl1 = imread('ccl1.png');
figure;
imshow(ccl1);

[XX, YY] = size(ccl1);

for x = 2:XX
    for y = 2:YY-1
        if ccl1(x, y) ~= 0
            neigbhours = [ccl1(x-1, y-1) ccl1(x-1, y) ccl1(x-1, y+1) ccl1(x, y-1)];
        end
    end
end
