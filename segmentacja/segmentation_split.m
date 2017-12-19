function segmentation_split(img, x1, y1, x2, y2)

global threshold;
global split_limit;
global segRes;
global index;
global mRes;

img_subpart = img(y1:y2, x1:x2);
img_mean = mean(img_subpart(:));
img_std = std(img_subpart(:));
    
if (img_std < threshold) || (abs(x2 - x1) <= split_limit)
    segRes(y1:y2, x1:x2) = index;
    index = index + 1;
    mRes(y1:y2, x1:x2) = img_mean;
else
    xN = round((x2 + x1) / 2);
    yN = round((y2 + y1) / 2);
    
    segmentation_split(img, x1, y1, xN, yN);
    segmentation_split(img, xN + 1, y1, x2, yN);
    segmentation_split(img, xN + 1, yN + 1, x2, y2);
    segmentation_split(img, x1, yN + 1, xN, y2);
end

end