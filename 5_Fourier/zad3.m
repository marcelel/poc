close all; clearvars; clc;

img = imread('kolo.bmp');
img_fft2 = fft2(img);
img_fftshift = fftshift(img_fft2);
img_ifftshift = ifftshift(img_fftshift);
img_ifft2 = ifft2(img_ifftshift);

figure;
subplot(3,1,1); imshow(img);
subplot(3,1,2); imshow(img_ifft2);
subplot(3,1,3); imshow(imabsdiff(uint8(img_ifft2), img));