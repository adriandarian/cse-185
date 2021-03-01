%% Task 1: Split Frequency
img = im2double(imread('images/lena.jpg'));

ratio = 0.1;

[low_pass_img, high_pass_img] = separate_frequency(img, ratio);

imwrite(low_pass_img, 'lena_low_0.1.jpg');
imwrite(high_pass_img + 0.5, 'lena_high_0.1.jpg');

ratio = 0.2;

[low_pass_img, high_pass_img] = separate_frequency(img, ratio);

imwrite(low_pass_img, 'lena_low_0.2.jpg');
imwrite(high_pass_img + 0.5, 'lena_high_0.2.jpg');

%% Task 2: Hybrid Image
name1 = 'images/marilyn.jpg';
name2 = 'images/einstein.jpg';

img1 = im2double(imread(name1));
img2 = im2double(imread(name2));

ratio = 0.1;
img_merged = hybrid_image(img1, img2, ratio);

figure, imshow(img_merged);
imwrite(img_merged, 'hybrid_1.jpg');

ratio = 0.2;
img_merged = hybrid_image(img1, img2, ratio);

figure, imshow(img_merged);
imwrite(img_merged, 'hybrid_2.jpg');