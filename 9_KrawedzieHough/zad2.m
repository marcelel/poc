close all; clearvars; clc;

obraz = zeros(11);
obraz(5,10) = 1;
[H,theta,rho] = hough(obraz, 'RhoResolution', 0.1, 'ThetaResolution', 0.5);
figure;
subplot(1,2,1); imshow(obraz); title('1 pkt');
subplot(1,2,2); imshow(H, []); title('Hough dla 1 pkt');

obraz(3,8) = 1;
[H,theta,rho] = hough(obraz, 'RhoResolution', 0.1, 'ThetaResolution', 0.5);
figure; 
subplot(1,2,1); imshow(obraz); title('2 pkt');
subplot(1,2,2); imshow(H, []); title('Hough dla 2 pkt');

obraz(9,2) = 1;
obraz(7,1) = 1;
[H,theta,rho] = hough(obraz, 'RhoResolution', 0.1, 'ThetaResolution', 0.5);
figure;
subplot(1,3,1); imshow(obraz); title('4 pkt');
subplot(1,3,2); imshow(H, []); title('Hough dla 4 pkt');

rho_param = rho(195);
theta_param = theta(302);
x = 0:0.1:10;
y = ((rho_param - x * cosd(theta_param)) / sin(theta_param));

subplot(1,3,3);
imshow(obraz);
hold on;
plot(x+1, y+1);
