img = im2double(imread('lena.jpg'));

sigma = 2.0;
hsize = 7;
scale = 5;

%% Gaussian Pyramid
I = img;
for s = 1 : scale
    
    % Gaussian filter
    I = gaussian_filter(I, hsize, sigma);
    
    % Save or show image
    imwrite(I, sprintf('Gaussian_scale%d.jpg', s));
    
    % Down-sampling
    I = imresize(I, 1/2);
end

%% Laplacian Pyramid
I = img;
for s = 1 : scale
    
    % Gaussian filtering
    gaussian_img = gaussian_filter(I, hsize, sigma);
    
    % Laplacian filtering
    I = I - gaussian_img;
    
    % Save or show image
    imwrite(I + 0.5, sprintf('Laplacian_scale%d.jpg', s));
    
    % Down-sampling
    I = imresize(I, 1/2);
end