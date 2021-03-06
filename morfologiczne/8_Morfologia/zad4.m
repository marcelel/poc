close all; clearvars; clc;

Calculator = imread('calculator.bmp');

%% 
%2
Calculator_erode = imerode(Calculator, ones(1,71));
Calculator_reconstruct = imreconstruct(Calculator_erode, Calculator);

figure;
subplot(1,3,1); imshow(Calculator); title('Original');
subplot(1,3,2); imshow(Calculator_erode); title('Erozja');
subplot(1,3,3); imshow(Calculator_reconstruct); title('Rekonstrukcja');

%%
Calculator_open = imopen(Calculator, ones(1,71));
Calculator_diff = Calculator - Calculator_reconstruct;
Calculator_tophat = imtophat(Calculator, strel('square', 3));

figure;
subplot(2,2,1); imshow(Calculator); title('Original');
subplot(2,2,2); imshow(Calculator_diff); title('Roznica');
subplot(2,2,3); imshow(Calculator_open); title('Klasyczne otwarcie');
subplot(2,2,4); imshow(Calculator_tophat); title('Top-hat');

%%
figure;
Calculator_reconstruct_vertical = imreconstruct(imerode(Calculator_diff, ones(1,11)), Calculator_diff);
subplot(1,2,1); imshow(Calculator_diff); title('Roznica');
subplot(1,2,2); imshow(Calculator_reconstruct_vertical); title('Odblaski pionowe');

%%
Calculator_dilate = imdilate(Calculator_reconstruct_vertical, ones(1,21));
figure;
subplot(1,3,1); imshow(Calculator); title('Original');
subplot(1,3,2); imshow(Calculator_dilate); title('Dylatacja');
subplot(1,3,3); imshow(imreconstruct(min(Calculator_dilate, Calculator_diff), Calculator_diff)); title('Rekonstrukcja');