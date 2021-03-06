close all; clearvars; clc;

Ertka = imread('ertka.bmp');

%%
Erode_square = imerode(Ertka, strel('square', 3));
Erode_diamond = imerode(Ertka, strel('diamond', 3));
Erode_line = imerode(Ertka, strel('line', 3, 3));
figure;
subplot(2,2,1); imshow(Ertka); title('Original');
subplot(2,2,2); imshow(Erode_square); title('Square');
subplot(2,2,3); imshow(Erode_diamond); title('Diamond');
subplot(2,2,4); imshow(Erode_line); title('Line');

%%
Erode_square = imerode(Ertka, strel('square', 3));
Erode_square2 = imerode(Erode_square, strel('square', 3));
Erode_square3 = imerode(Erode_square2, strel('square', 3));
figure;
subplot(2,2,1); imshow(Ertka); title('Original');
subplot(2,2,2); imshow(Erode_square); title('Square');
subplot(2,2,3); imshow(Erode_square2); title('Square 2');
subplot(2,2,4); imshow(Erode_square3); title('Square 3');

%%
Buzka = imread('buzka.bmp');
M1 = [1 0 0; 0 1 0; 0 0 1];
M2 = [0 0 1; 0 1 0; 1 0 0];
Buzka_Erode1 = imerode(Buzka, M1);
Buzka_Erode2 = imerode(Buzka, M2);
figure;
subplot(1,3,1); imshow(Buzka);
subplot(1,3,2); imshow(Buzka_Erode1);
subplot(1,3,3); imshow(Buzka_Erode2);

%%
Ertka_dilate = imdilate(Ertka, strel('square', 3));
figure;
subplot(1,2,1); imshow(Ertka);
subplot(1,2,2); imshow(Ertka_dilate);

%%
figure;
subplot(2,2,1); imshow(imerode(Ertka, strel('square', 3))); title('Erozja');
subplot(2,2,2); imshow(imdilate(Ertka, strel('square', 3))); title('Dylatacja');
subplot(2,2,3); imshow(imopen(Ertka, strel('square', 3))); title('Otwarcie');
subplot(2,2,4); imshow(imclose(Ertka, strel('square', 3))); title('Zamknięcie');

%%
Ertka_open = imopen(Ertka, strel('square', 3));
Ertka_final = imclose(Ertka_open, strel('square', 3));
figure;
imshow(Ertka_final);

%%
Hom = imread('hom.bmp');
SE1 = [0 1 0; 1 1 1; 0 1 0];
SE2 = [1 0 1; 0 0 0; 1 0 1];
Hom_bwhitmiss = bwhitmiss(Hom, SE1, SE2);
figure; 
subplot(1,2,1); imshow(Hom);
subplot(1,2,2); imshow(Hom_bwhitmiss);