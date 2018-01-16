function xfimage(img)

dwieFale = imread(img);
dwieFale_fft2 = fft2(dwieFale);
dwieFale_fftshift = fftshift(dwieFale_fft2);
A = abs(dwieFale_fftshift);
A = log10(A + 1);
F = angle(dwieFale_fftshift.*(A > 0.0001));

figure;
subplot(1,3,1); imshow(dwieFale);
subplot(1,3,2); imshow(A, []);
subplot(1,3,3); imshow(F);

end