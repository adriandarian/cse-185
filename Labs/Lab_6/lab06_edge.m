
img = im2double(imread('lena.jpg'));

%% compute gradient magnitude and orientation with Sobel filter
[magnitude, orientation] = sobel_feature(img);

figure, imshow(magnitude); title('Gradient Magnitude');
figure, imagesc(orientation); colormap jet; axis image; colorbar; title('Gradient Orientation');

imwrite(magnitude, 'lena_sobel_magnitude.jpg');
h = gcf; saveas(h, 'lena_sobel_orientation.jpg');


%% apply thresholding to detect edge
threshold = 0.3;
e = magnitude > threshold;
figure, imshow(e); title(sprintf('Detected edge (threshold = %s)', num2str(threshold)));

imwrite(e, sprintf('lena_edge_threshold_%s.jpg', num2str(threshold)));


%% use built-in function to detect edge
e1 = img; % change img to sobel edge detection
e2 = img; % change img to canny edge detection

figure, imshow(img);
figure, imshow(e1); title('Sobel Edge');
figure, imshow(e2); title('Canny Edge');

imwrite(e1, 'lena_sobel.jpg');
imwrite(e2, 'lena_canny.jpg');
