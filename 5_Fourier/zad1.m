close all; clearvars; clc;

fimage('dwieFale.bmp');
fimage('kolo.bmp')
fimage('kwadrat.bmp');
fimage('kwadrat45.bmp');
fimage('trojkat.bmp');
    
dwieFale = imread('dwieFale.bmp');
dwieFale_fft2 = fft2(dwieFale);
F1 = fft(dwieFale, [], 1);
F2 = fft(F1, [], 2);

figure;
subplot(1,2,1); imshow(dwieFale_fft2);
subplot(1,2,2); imshow(F2);