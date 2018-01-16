close all; clearvars; clc;

kwadrat = imread('kwadrat.bmp');
kwadratT = imread('kwadratT.bmp');
kwadratS = imread('kwadratS.bmp');
kwadrat45 = imread('kwadrat45.bmp');
kwadratKL = imread('kwadratKL.bmp');

transfomacja_fourier(kwadrat);
title('Faza Kwadrat');

transfomacja_fourier(imtranslate(kwadrat,[25.3, -10.1]));
title('Faza imtranslate(kwadrat)');

transfomacja_fourier(imrotate(kwadrat,-1));
title('Faza imrotate(kwadrat)');

transfomacja_fourier(imresize(kwadrat,0.5));
title('Faza imresize(kwadrat)');

transfomacja_fourier(imlincomb(1.5,kwadrat));
title('Faza imlincomb(kwadrat)');

transfomacja_fourier(kwadratT);
title('Faza KwadratT');

transfomacja_fourier(imtranslate(kwadratT,[25.3, -10.1]));
title('Faza imtranslate(kwadratT)');

transfomacja_fourier(kwadratS);
title('Faza KwadratS');

transfomacja_fourier(imresize(kwadratS,0.6));
title('Faza imresize(kwadratS)');

transfomacja_fourier(kwadrat45);
title('Faza Kwadrat45');

transfomacja_fourier(imrotate(kwadrat45,-1));
title('Faza imrotate(kwadrat45)');

transfomacja_fourier(imlincomb(1.5,kwadrat45));
title('Faza imlincomb(kwadrat45)');

transfomacja_fourier(kwadratKL);
title('Faza KwadratKL');

transfomacja_fourier(imlincomb(1.5,kwadratKL));
title('Faza imlincomb(kwadratKL)');
