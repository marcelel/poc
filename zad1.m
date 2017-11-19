clc; close all; clearvars;

load MR_data;

local_window = [5 5];

figure(1);
subplot(1,3,1); imshow(I_noisy1,[]); title('Noisy1');
subplot(1,3,2); imshow(convolution(I_noisy1, local_window), []); title('Noisy1 splot');
subplot(1,3,3); imshow(bilateral(I_noisy1, local_window), []); title('Noisy1 bilateralny');

figure(2);
subplot(1,3,1); imshow(I_noisy2,[]); title('Noisy2');
subplot(1,3,2); imshow(convolution(I_noisy2, local_window), []); title('Noisy2 splot');
subplot(1,3,3); imshow(bilateral(I_noisy2, local_window), []); title('Noisy2 bilateralny');

figure(3);
subplot(1,3,1); imshow(I_noisy3,[]); title('Noisy3');
subplot(1,3,2); imshow(convolution(I_noisy3, local_window), []); title('Noisy3 splot');
subplot(1,3,3); imshow(bilateral(I_noisy3, local_window), []); title('Noisy3 bilateralny');

figure(4);
subplot(1,3,1); imshow(I_noisy4,[]); title('Noisy4');
subplot(1,3,2); imshow(convolution(I_noisy4, local_window), []); title('Noisy4 splot');
subplot(1,3,3); imshow(bilateral(I_noisy4, local_window), []); title('Noisy4 bilateralny');

figure(5);
subplot(1,3,1); imshow(I_noisefree,[]); title('NoiseFree');
subplot(1,3,2); imshow(convolution(I_noisefree, local_window), []); title('NoiseFree splot');
subplot(1,3,3); imshow(bilateral(I_noisefree, local_window), []); title('NoiseFree bilateralny');