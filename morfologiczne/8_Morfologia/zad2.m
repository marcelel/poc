close all; clearvars; clc;

Fingerprint = imread('fingerprint.bmp');

%%
Fingerprint_bwmorph_1 = bwmorph(Fingerprint, 'thin', 1);
Fingerprint_bwmorph_2 = bwmorph(Fingerprint, 'thin', 2);
Fingerprint_bwmorph_Inf = bwmorph(Fingerprint, 'thin', Inf);
figure;
subplot(2,2,1); imshow(Fingerprint); title('Fingerprint');
subplot(2,2,2); imshow(Fingerprint_bwmorph_1); title('Fingerprint bwmorph 1');
subplot(2,2,3); imshow(Fingerprint_bwmorph_2); title('Fingerprint bwmorph 2');
subplot(2,2,4); imshow(Fingerprint_bwmorph_Inf); title('Fingerprint bwmorph Inf');

%%
Kosc = imread('kosc.bmp');
Kosc_bwmorph = bwmorph(Kosc, 'skel', Inf);
figure;
subplot(1,2,1); imshow(Kosc); title('Kosc');
subplot(1,2,2); imshow(Kosc_bwmorph); title('Kosc bwmorph');

%% 
Text = imread('text.bmp');
figure;
subplot(1,3,1); imshow(Text); title('Text');
subplot(1,3,2); imshow(imopen(Text, ones(51,1))); title('Otwarcie');
subplot(1,3,3); imshow(imreconstruct(imerode(Text, ones(51,1)), Text)); title('Rekonstrukcja');

figure;
subplot(1,2,1); imshow(Text); title('Text');
subplot(1,2,2); imshow(imfill(Text, 'holes')); title('Fill holes');

figure;
subplot(1,2,1); imshow(Text); title('Text');
subplot(1,2,2); imshow(imclearborder(Text)); title('Clear border');


