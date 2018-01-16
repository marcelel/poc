close all; clearvars; clc;

img = imread('lena.bmp');
img_fft2 = fft2(img);
img_fftshift = fftshift(img_fft2);

[f1, f2] = freqspace(512, 'meshgrid');
r = sqrt(f1.^2 + f2.^2);

%dolno
Hd1 = ones(512);
Hd1((r>0.1)) = 0;
img_fftshift_Hd1 = img_fftshift .* Hd1;
%gorno
Hd2 = ones(512);
Hd2((r<0.1)) = 0;
img_fftshift_Hd2 = img_fftshift .* Hd2;
%pasmowo 
Hd3 = ones(512);
Hd3((r<0.1)) = 0;
Hd3((r>0.3)) = 0;
img_fftshift_Hd3 = img_fftshift .* Hd3;

img_ifftshift_Hd1 = ifftshift(img_fftshift_Hd1);
img_ifft2_Hd1 = ifft2(img_ifftshift_Hd1);
img_ifftshift_Hd2 = ifftshift(img_fftshift_Hd2);
img_ifft2_Hd2 = ifft2(img_ifftshift_Hd2);
img_ifftshift_Hd3 = ifftshift(img_fftshift_Hd3);
img_ifft2_Hd3 = ifft2(img_ifftshift_Hd3);

figure;
subplot(3,1,1); imshow(img_ifft2_Hd1, []);
subplot(3,1,2); imshow(img_ifft2_Hd2, []);
subplot(3,1,3); imshow(img_ifft2_Hd3, []);

