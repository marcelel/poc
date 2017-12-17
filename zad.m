close all; clearvars; clc;

global threshold;
global split_limit;
global segRes
global index;
global mRes

umbrella = imread('umbrella.png');
figure;
imshow(umbrella);

umbrella_rgb2hsv = rgb2hsv(umbrella);
umbrella_rgb2hsv_H = double(umbrella_rgb2hsv(:, :, 1));
[Y, X] = size(umbrella);

color = 5/255;
threshold = 0.05;
split_limit = 8;
index = 1;
segRes = zeros(Y, X);
mRes = zeros(Y, X);

segmentation_split(umbrella, 1, 1, X, Y);

segRes_split = segRes;
mRes_split = mRes;

i = 0;
while i < index
    IB = segRes == i;
    
    if any(IB)
    else
        i = i + 1;
    end
end