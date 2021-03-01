function I2 = median_filter(I1, patch)
   I2 = zeros(size(I1));
   for u = 1 + patch(2) : size(I1, 2) - patch(2)
       for v = 1 + patch(1) : size(I1, 1) - patch(1)   
           p = I1((v - floor(patch(1)/2)):(v + floor(patch(1)/2)), (u - floor(patch(2)/2):(u + floor(patch(2)/2)))); 
           p = p(:); % convert to vector
           value = median(p); % calculate median
           I2(v, u) = value;
       end
   end
end