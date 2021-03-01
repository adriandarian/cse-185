img = im2double(imread('lena.jpg'));
fprintf('Load lena.jpg...\n');

%% Sobel filter
H = [1, 2, 1; 0, 0, 0; -1, -2, -1]; % horizontal edge
V = [1, 0, -1; 2, 0 ,-2; 1, 0, -1]; % vertical edge

img_sobel = sobel_filter(img, H);
imwrite(img_sobel, 'sobel_h.jpg');

img_sobel = sobel_filter(img, V);
imwrite(img_sobel, 'sobel_v.jpg');

%% Gaussian filter
img_gaussian = gaussian_filter(img, 5, 2);
figure, imshow(img_gaussian);
imwrite(img_gaussian, 'gaussian_5.jpg');

img_gaussian = gaussian_filter(img, 9, 4);
figure, imshow(img_gaussian);
imwrite(img_gaussian, 'gaussian_9.jpg');