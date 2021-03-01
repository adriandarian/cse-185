function output = sobel_filter(img, kernel)
    I = zeros(size(img));
    for u = 2 + 1 : size(img, 2) - 1
        for v = 2 + 1 : size(img, 1) - 1
            patch = sum(sum(kernel.*img(v - 1 : v + 1, u - 1 : u + 1)));
            I(v, u) = patch;
        end
    end
    output = I;
end