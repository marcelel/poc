close all;
clearvars;
clc;

im = imread('lena.bmp');

figure();
imshow(im); title('Oryginalny');
figure();
[fTrans, amplitude, phase] = transformat(im);


[f1,f2] = freqspace(512,'meshgrid');
Hd = ones(512);
r = sqrt(f1.^2 + f2.^2);
Hd((r > 0.1)) = 0;
%gornoprzepustowy
% Hd((r < 0.3)) = 0;
%pasmowo przepustowy
% Hd((r < 0.1) | (r > 0.4)) = 0;
    


figure();
subplot(2,2,1);
mesh(f1,f2,Hd); title('Filtr');

subplot(2,2,2);
filtered = fTrans.*Hd;
unshifted = ifftshift(filtered);
reverseTransformat = ifft2(unshifted);
imshow(reverseTransformat,[]); title('Odwrocona transformata');


h = fwind1(Hd,hanning(21));
[H f1 f2] = freqz2(h, 512, 512);

subplot(2,2,3);
mesh(f1,f2, H); title('Filtr 2D');
subplot(2,2,4);
filtered2 = fTrans.*H;
unshifted2 = ifftshift(filtered2);
reverseTransformat2 = ifft2(unshifted2);
imshow(reverseTransformat2,[]); title('Odwrocona transformata f2D');


