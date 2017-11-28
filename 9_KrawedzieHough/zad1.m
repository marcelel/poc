close all; clearvars; clc;

dom = imread('dom.png');

%%
dom_log = edge(dom,'log');
figure;
subplot(1,2,1); imshow(dom);
subplot(1,2,2); imshow(dom_log);

%%
dom_canny = edge(dom, 'canny');
figure;
subplot(1,2,1); imshow(dom);
subplot(1,2,2); imshow(dom_canny);

%%
dom_sobel = edge(dom, 'sobel', 0.05);
figure;
subplot(2,2,1); imshow(dom); title('original');
subplot(2,2,2); imshow(dom_log); title('log');
subplot(2,2,3); imshow(dom_canny); title('canny');
subplot(2,2,4); imshow(dom_sobel); title('sobel');

%% TODO: dobrac recznie
