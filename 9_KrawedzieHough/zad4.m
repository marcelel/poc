close all; clearvars; clc;

lab = imread('lab112.png');

lab_binerize = imcomplement(im2bw(lab, 35/255));
lab_erode = imerode(lab_binerize, ones(1, 5));
figure;
subplot(1,3,1); imshow(lab); title('lab112');
subplot(1,3,2); imshow(lab_binerize); title('binaryzacja');
subplot(1,3,3); imshow(lab_erode); title('erode');

lab_edge = edge(lab_erode,'Sobel', []);
[H, theta, rho] = hough(lab_edge);
peaks = houghpeaks(H, 8);
lines = houghlines(lab_edge, theta, rho, peaks);
figure, imshow(lab), hold on
max_len = 0;
for k = 1:length(lines)
   xy = [lines(k).point1; lines(k).point2];
   plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');

   % Plot beginnings and ends of lines
   plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
   plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');

   % Determine the endpoints of the longest line segment
   len = norm(lines(k).point1 - lines(k)    .point2);
   if ( len > max_len)
      max_len = len;
      xy_long = xy;
   end
end