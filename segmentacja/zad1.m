close all; clearvars; clc;

knee = imread('knee.png');
knee_double = double(knee);
imshow(knee);

%%[x, y] = ginput(1);
x = 341;
y = 212;

visited = zeros(size(knee));
segmented = zeros(size(knee));
stack = zeros(10000, 2);
iStack = 1;

stack(1,:) = [x, y];
visited(x, y) = 1;
segmented(x, y) = 1;

mV = knee_double(x, y);
nS = 1;

while iStack > 0
    brigthness = 47;
    x = stack(iStack, 1);
    y = stack(iStack, 2);
    value = knee_double(x, y);
    iStack = iStack - 1;
    nS = nS + 1;
    mV = (mV * (nS - 1) + knee_double(x, y)) / nS;
    for i = x-1:x+1
        for j = y-1:y+1
            diff = mV - knee_double(i, j);
            if (diff < brigthness && visited(i, j) == 0)
                iStack = iStack + 1;
                stack(iStack, :) = [i, j];
                segmented(i, j) = 1;
            end
            visited(i, j) = 1;
        end
    end
end

figure;
imshow(segmented, []);