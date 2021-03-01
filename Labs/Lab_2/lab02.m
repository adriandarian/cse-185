% Forward Rotation
I1 = imread('01.jpg');
fprintf('Load 01.jpg...\n');

I2 = zeros(300, 400 + 50, 3, 'uint8');

for y1 = 1:300
    for x1 = 1:400
        x2 = round(cosd(45) * (x1 - 200) + sind(45) * (y1 - 150) + 200);
        y2 = round(-sind(45) * (x1 - 200) + cosd(45) * (y1 - 150) + 150);
        
        if (x2 >= 1 && x2 <= 400 && y2 >= 1 && y2 <= 300)
            I2(y2, x2, :) = I1(y1, x1, :);
        end
    end
end

imwrite(I2, 'rotate_0.jpg');
fprintf('Save rotate_0.jpg...\n');

% Backward Rotation
I1 = imread('01.jpg');
fprintf('Load 01.jpg...\n');

I2 = zeros(300, 400 + 50, 3, 'uint8');

for y1 = 1:300
    for x1 = 1:400
        x2 = round(cosd(45) * (x1 - 200) - sind(45) * (y1 - 150) + 200);
        y2 = round(sind(45) * (x1 - 200) + cosd(45) * (y1 - 150) + 150);
        
        if (x2 >= 1 && x2 <= 400 && y2 >= 1 && y2 <= 300)
            I2(y1, x1, :) = I1(y2, x2, :);
        end
    end
end

imwrite(I2, 'rotate_1.jpg');
fprintf('Save rotate_1.jpg...\n');

% median filter at patch size 3
I1 = im2double(imread('lena_noisy.jpg'));
fprintf('Load lena_noisy.jpg...\n');
I2 = median_filter(I1, [3, 3]);
% figure, imshow(I2);
imwrite(I2, 'median_0.jpg');
fprintf('Save median_0.jpg...\n');

% median filter at patch size 5
I1 = im2double(imread('lena_noisy.jpg'));
fprintf('Load lena_noisy.jpg...\n');
I2 = median_filter(I1, [5, 5]);
figure, imshow(I2);
imwrite(I2, 'median_1.jpg');
fprintf('Save median_1.jpg...\n');