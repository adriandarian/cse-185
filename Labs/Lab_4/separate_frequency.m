function [low_pass_img, high_pass_img] = separate_frequency(img, ratio)
    %% apply FFT
    frequency_map = fft2(img);
    
    %% shft the frequency map
    frequency_map_shifted = fftshift(frequency_map);
    
    %% compute low-frequency mask
    [height, width, ~] = size(img);
    y1 = floor(height / 2 - (height * ratio / 2));
    y2 = floor(height / 2 + (height * ratio / 2));
    x1 = floor(width / 2 - (width * ratio / 2));
    x2 = floor(width / 2 + (width * ratio / 2));
    mask = zeros(size(img));
    mask(y1 : y2, x1 : x2, :) = 1;
    
    %% separate low-frequency and high-frequency maps
    low_frequency_map_shifted = frequency_map_shifted .* mask;
    high_frequency_map_shifted = frequency_map_shifted .* (1 - mask);
    
    %% shift frequency maps back
    low_frequency_map = ifftshift(low_frequency_map_shifted);
    high_frequency_map = ifftshift(high_frequency_map_shifted);
    
    %% apply Inverse FFT
    low_pass_img = real(ifft2(low_frequency_map));
    high_pass_img = real(ifft2(high_frequency_map));
end

