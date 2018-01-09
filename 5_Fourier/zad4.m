close all; clearvars; clc;

img = imread('lena.bmp');
img_fft2 = fft2(img);
img_fftshift = fftshift(img_fft2);

[fi, f2] = freqspace(512, 'meshgrid');
Hd = ones(512);
r = sqrt(f1.^2 + f2.^2);
Hd((r>0.1)) = 0;