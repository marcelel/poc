close all; clearvars; clc;

ccl1 = imread('ccl1.png');
figure;
imshow(ccl1);

[XX, YY] = size(ccl1);

N = 100;
L = 1;
id = 1:N;
tab = zeros(N);
for x = 2:XX
    for y = 2:(YY-1)
        if ccl1(x, y) ~= 0
            neighbours = [ccl1(x-1, y-1) ccl1(x-1, y) ccl1(x-1, y+1) ccl1(x, y-1)];
            n_sum = sum(neighbours);
            if n_sum == 0
                ccl1(x, y) = L;
                L = L+1;
            elseif n_sum > 0
                neigbhours_nonzeros = nonzeros(neighbours);
                n_min = min(neigbhours_nonzeros);
                n_max = max(neigbhours_nonzeros);
                if n_min == n_max 
                    ccl1(x, y) = n_min;
                else 
                    ccl1(x, y) = n_min;
                    id = union(id, n_min, n_max);
                end
            end
        end
    end
end

ccl1_before_union = ccl1;

for i = 1:N;
    tab(i) = root(id, i);
end

for x = 2:XX
    for y = 2:(YY-1)
        if ccl1(x, y) > 0
            ccl1(x, y) = tab(ccl1(x, y));
        end
    end
end

ccl2 = imread('ccl2.png');

figure;
subplot(2,2,1); imshow(ccl1_before_union, []);
subplot(2,2,2); imshow(ccl1, []);
subplot(2,2,3); imshow(bwlabel(ccl2, 4), []);
subplot(2,2,4); imshow(bwlabel(ccl2, 8), []);

