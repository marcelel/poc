close all; clearvars; clc;

Ferrari = imread('ferrari.bmp');

%%
figure;
subplot(2,2,1); imshow(Ferrari); title('Ferrari');
subplot(2,2,2); imshow(imerode(Ferrari, strel('square', 3))); title('Erozja');
subplot(2,2,3); imshow(imdilate(Ferrari, strel('square', 3))); title('Dylatacja');
subplot(2,2,4); imshow(imdilate(Ferrari, strel('square', 3)) - imerode(Ferrari, strel('square', 3))); title('Roznica');

%%
figure;
subplot(1,3,1); imshow(Ferrari); title('Ferrari');
subplot(1,3,2); imshow(imopen(Ferrari, strel('square', 3))); title('Otwarcie');
subplot(1,3,3); imshow(imclose(Ferrari, strel('square', 3))); title('Zamkniecie');

%%
figure;
subplot(1,3,1); imshow(Ferrari); title('Ferrari');
subplot(1,3,2); imshow(imtophat(Ferrari, strel('square', 3))); title('Top-hat');
subplot(1,3,3); imshow(imbothat(Ferrari, strel('square', 3))); title('Bottom-hat');

%%
Rice = imread('rice.png');
figure;
subplot(1,2,1); imshow(Rice); title('Rice');
subplot(1,2,2); imshow(imtophat(Rice, strel('disk',10))); title('Top-hat z disk 10');