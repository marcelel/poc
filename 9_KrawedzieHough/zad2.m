close all; clearvars; clc;

obraz = zeros(11);
obraz(5,10) = 1;
[H,theta,rho] = hough(obraz, 'RhoResolution', 0.1, 'ThetaResolution', 0.5);
figure;
imshow(H, []);

obraz(3,8) = 1;
[H,theta,rho] = hough(obraz, 'RhoResolution', 0.1, 'ThetaResolution', 0.5);
figure;
imshow(H, []);

obraz(9,2) = 1;
obraz(7,1) = 1;
[H,theta,rho] = hough(obraz, 'RhoResolution', 0.1, 'ThetaResolution', 0.5);
figure;
imshow(H, []);

rho_param = rho(195);
theta_param = theta(302);
x = 0:0.1:10;
y = ((rho_param - x * cosd(theta_param)) / sin(theta_param));

figure;
imshow(obraz);
hold on;
plot(x+1, y+1);