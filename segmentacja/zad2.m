close all; clearvars; clc;

global threshold;
global split_limit;
global segRes
global index;
global mRes

umbrella = imread('umbrealla.png');
figure;
imshow(umbrella);

umbrella_rgb2hsv = rgb2hsv(umbrella);
umbrella_rgb2hsv_H = double(umbrella_rgb2hsv(:, :, 1));
[Y, X] = size(umbrella_rgb2hsv_H);

color = 5/255;
threshold = 0.05;
split_limit = 8;
index = 1;
segRes = zeros(Y, X);
mRes = zeros(Y, X);

segmentation_split(umbrella_rgb2hsv_H, 1, 1, X, Y);

i = 0;
while i <= index
    IB = segRes == i;
    if any(IB(:))
        [yF, xF] = find(IB, 1, 'first');
        IB_dilate = imdilate(IB, strel('square', 3));
        IB_diff = abs(IB_dilate - IB);
        IB_mult = IB_diff .* segRes;
        IB_unique = unique(nonzeros(IB_mult));
        flag = 0;
        
        for j = 1:numel(IB_unique)
            IBS = segRes == IB_unique(j);
            [yFS, xFS] = find(IBS, 1, 'first');
            diff = abs(mRes(yF, xF) - mRes(yFS, xFS));
            if (diff < color)
                segRes(IBS) = i;
                flag = 1;
            end
        end
        
        if flag == 0
            i = i + 1;
        end
    else
        i = i + 1;
    end
end

U = unique(segRes);
for i = 1:numel(U)
    subpart = segRes == U(i);
    if sum(subpart) < 25
        segRes(subpart) = 0;
    end
end

U2 = unique(segRes);
for i = 1:numel(U2)
    subpart = segRes == U(i);
    segRes(subpart) = i;
end

segRes_label2rgb = label2rgb(segRes);

figure;
imshow(segRes_label2rgb); title('Img Final');

