function output = gaussian_filter(img, hsize, sigma)
    H = fspecial('gaussian', hsize, sigma);
    output = zeros(size(img));
    for u = 1 + size(H, 2) : size(img, 2) - size(H, 2)
        for v = 1 + size(H, 1) : size(img, 1) - size(H, 1)
            patch = img(v - floor(size(H, 1)/2) : v + floor(size(H, 1)/2), u - floor(size(H, 2)/2) : u + floor(size(H, 2)/2)).*H;
            output(v, u) = sum(sum(patch(:)));
        end
    end
end