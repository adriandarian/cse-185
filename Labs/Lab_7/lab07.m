
% name = 'baboon';
% name = 'cameraman';
name = 'checkboard';

I = im2double(imread(sprintf('%s.png', name)));

%% parameters
sigma1 = 1;
sigma2 = 2;
alpha = 0.04;
R_threshold = 1e-5 * 5;

%% apply corner detector
[corner_x, corner_y] = Harris_corner_detector(I, sigma1, sigma2, alpha, R_threshold, name);


%% visualize results
figure, imshow(I); hold on;
plot(corner_x, corner_y, 'ro');

h = gcf; saveas(h, sprintf('%s_corners.png', name));