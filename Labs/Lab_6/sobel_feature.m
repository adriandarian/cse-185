function [magnitude, orientation] = sobel_feature(img)
    % horizontal edge
    Hy = [1, 2, 1; 0, 0, 0; -1, -2, -1];
    % vertical edge
    Hx = [1, 0, -1; 2, 0, -2; 1, 0, -1];
    %% Sobel filtering
    sobel_H_filter = imfilter(img, Hy);
    sobel_V_filter = imfilter(img, Hx);
    %% compute gradient magnitude and orientation
    magnitude = sqrt((sobel_H_filter.^2) + (sobel_V_filter.^2));
    orientation = atan2(sobel_H_filter, sobel_V_filter);
end