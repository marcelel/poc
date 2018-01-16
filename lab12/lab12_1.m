%%
close all;
clearvars;
clc;


im = imread('dwieFale.bmp');
% im = imread('kolo.bmp');
%im = imread('kwadrat.bmp');
% im = imread('kwadrat45.bmp');
% im = imread('trojkat.bmp');

[fTrans, amplitude, phase] = transformat(im);

F1 = fft(im,[],1);
F2 = fft(F1,[],2);

shifted2 = fftshift(F2);

amplitude2 = log10(abs(shifted2)+1);
phase2 = angle(F2.*(amplitude2 > 0.0001));



figure();
subplot(1,2,1);
imshow(imabsdiff(amplitude2,amplitude)); title('Roznica amplitud');
subplot(1,2,2);
imshow(imabsdiff(phase2,phase)); title('Roznica faz');

%%

close all;
clearvars;
clc;

kwadrat = imread('kwadrat.bmp');
kwadratT = imread('kwadratT.bmp');
kwadratS = imread('kwadratS.bmp');
kwadrat45 = imread('kwadrat45.bmp');
kwadratKL = imread('kwadratKL.bmp');


figure();
[k, kA, kP] = transformat(kwadrat);
title('Faza Kwadrat');

figure();
transformat(imtranslate(kwadrat,[25.3, -10.1]));
title('Faza imtranslate(kwadrat)');

figure();
transformat(imrotate(kwadrat,-1));
title('Faza imrotate(kwadrat)');

figure();
transformat(imresize(kwadrat,0.5));
title('Faza imresize(kwadrat)');

figure();
transformat(imlincomb(1.5,kwadrat));
title('Faza imlincomb(kwadrat)');

figure();
[kT, kTA, kTP] = transformat(kwadratT);
title('Faza KwadratT');

figure();
transformat(imtranslate(kwadratT,[25.3, -10.1]));
title('Faza imtranslate(kwadratT)');

figure();
[kS, kSA, kSP] = transformat(kwadratS);
title('Faza KwadratS');

figure();
transformat(imresize(kwadratS,0.6));
title('Faza imresize(kwadratS)');

figure();
[k45, k45A, k45P] = transformat(kwadrat45);
title('Faza Kwadrat45');

figure();
transformat(imrotate(kwadrat45,-1));
title('Faza imrotate(kwadrat45)');

figure();
transformat(imlincomb(1.5,kwadrat45));
title('Faza imlincomb(kwadrat45)');

figure();
[kKL, kKLA, kKLP] = transformat(kwadratKL);
title('Faza KwadratKL');

figure();
transformat(imlincomb(1.5,kwadratKL));
title('Faza imlincomb(kwadratKL)');


%%

close all;
clearvars;
clc;

im = imread('kolo.bmp');

[fTrans, amplitude, phase] = transformat(im);

unshifted = ifftshift(fTrans);

reverseTransformat = (ifft2(unshifted));

figure();
subplot(1,3,1);
imshow(im); title('Oryginalny');
subplot(1,3,2);
imshow(reverseTransformat); title('Odwrocona transformata');
subplot(1,3,3);
imshow(imabsdiff(double(im),reverseTransformat)); title('Roznica');
