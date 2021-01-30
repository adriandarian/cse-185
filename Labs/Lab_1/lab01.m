% PART 1
% load image
img = imread('01.jpg');
fprintf('Load 01.jpg...\n');
% green channel
img(:, :, 2) = 0;
% save image
imwrite(img, 'green.jpg');
fprintf('Save green.jpg...\n');

% PART 2
% load image
img = imread('01.jpg');
fprintf('Load 01.jpg...\n');
% greyscale
img = 0.299*img(:, :, 1) + 0.587*img(:, :, 2) + 0.114*img(:, :, 3);
% save image
imwrite(img, 'gray.jpg');
fprintf('Save gray.jpg...\n');

% PART 3
% load image
img = imread('01.jpg');
fprintf('Load 01.jpg...\n');
% rotate image
img = imrotate(img, 90);
% save image
imwrite(img, 'rotate.jpg');
fprintf('Save rotate.jpg...\n');

% PART 4
% load image
img = imread('01.jpg');
fprintf('Load 01.jpg...\n');
% crop image
img = img(30:100, 270:300, :);
% save image
imwrite(img, 'crop.jpg');
fprintf('Save crop.jpg...\n');

% PART 5
% load image
img = imread('01.jpg');
fprintf('Load 01.jpg...\n');
% flip image
img = flip(img, 2);
% save image
imwrite(img, 'flip.jpg');
fprintf('Save flip.jpg...\n');

% PART 6
% load image
img1 = imread('01.jpg');
fprintf('Load 01.jpg...\n');
img2 = imread('02.jpg');
fprintf('Load 02.jpg...\n');
img3 = imread('03.jpg');
fprintf('Load 03.jpg...\n');
img4 = imread('04.jpg');
fprintf('Load 04.jpg...\n');
% combine 4 images
canvas = zeros(300 * 2 + 10, 400 * 2 + 10, 3, 'uint8');
canvas(1:300, 1:400, :) = img1;
canvas(1:300, 411:810, :) = img2;
canvas(311:610, 1:400, :) = img3;
canvas(311:610, 411:810, :) = img4;
% save image
imwrite(canvas, 'combine.jpg');
fprintf('Save combine.jpg...\n');

% PART 7
% load image
img5 = imread('05.jpg');
fprintf('Load 05.jpg...\n');
img6 = imread('06.jpg');
fprintf('Load 06.jpg...\n');
% compute the average of 2 images
img5 = img5(:);
img6 = img6(:);
img = (img5 + img6) / 2;
img = reshape(img, 375, 1242, 3);
% save image
imwrite(img, 'average.jpg');
fprintf('Save average.jpg...\n');

