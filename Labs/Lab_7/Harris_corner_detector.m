function [corner_x, corner_y] = Harris_corner_detector...
                                    (I, sigma1, sigma2, alpha, R_threshold, name)
                        
	% Gaussian kernels
    hsize1 = 1 + 2 * ceil(sigma1 * 2);
    hsize2 = 1 + 2 * ceil(sigma2 * 2);

    gaussian_kernel1 = fspecial('gaussian', hsize1, sigma1);
    gaussian_kernel2 = fspecial('gaussian', hsize2, sigma2);

    Dx = [1, 0, -1];
    Dy = [1; 0; -1];
    
    % Use derivative of Gaussian to compute x-gradient (Ix) and y-gradient (Iy)
    Ix = imfilter(imfilter(I, gaussian_kernel1, 'replicate'), Dx, 'replicate');
    Iy = imfilter(imfilter(I, gaussian_kernel1, 'replicate'), Dy, 'replicate');

    subplot(2,3,1)
    imshow(Ix + 0.5);
    imwrite(Ix, strcat(name, '_Ix.png'));
    subplot(2,3,2)
    imshow(Iy + 0.5);
    imwrite(Iy, strcat(name, '_Iy.png'));

    % compute Ixx, Iyy, Ixy
    Ixx = Ix .* Ix;
    Iyy = Iy .* Iy;
    Ixy = Ix .* Iy;
    
    % compute Sxx, Syy, Sxy
    Sxx = imfilter(Ixx, gaussian_kernel2, 'replicate');
    Syy = imfilter(Iyy, gaussian_kernel2, 'replicate');
    Sxy = imfilter(Ixy, gaussian_kernel2, 'replicate');
    
    % compute corner response from determine and trace
    det = (Sxx .* Syy) - (Sxy .* Sxy);
    trace = Sxx + Syy;
    
    R = det - (alpha*(trace.^2));

    subplot(2,3,3)
    imagesc(R); colormap jet; colorbar; axis image;
    imwrite(R, strcat(name, '_R.png'));    
    
    % find corner map with R > R_threshold
    corner_map = R > R_threshold;
    
    subplot(2,3,4)
    imshow(corner_map);
    imwrite(corner_map, strcat(name, '_corner_map.png'));

    % find local maxima of R
        
    local_maxima = imregionalmax(R);   
    
    subplot(2,3,5)
    imshow(local_maxima)
    imwrite(local_maxima, strcat(name, '_local_maxima.png'));
    
    % final corner map and corner x, y coordinates
    final_corner_map = (corner_map & local_maxima);
    imwrite(final_corner_map, strcat(name, '_final_corner_map.png'));
    
    [corner_y, corner_x] = find(final_corner_map);

end

function P = inregionalmax(R)                                                                                       %#ok<DEFNU>
     shift_u = size(R,2);
     shift_v = size(R,1);

     for u = 1+shift_u: size(R, 2)-shift_u
         for v = 1+ shift_v: size(R, 1)-shift_v
             x1 = u - floor(shift_u/2);
             x2 = u + floor(shift_u/2);
             y1 = v - floor(shift_v/2); 
             y2 = v + floor(shift_v/2);

             P = R(y1:y2, x1:x2); 
             
             if(R > R(shift_u - 1, shift_v - 1) && ...
                R > R(shift_u - 1, shift_v) && ...
                R > R(shift_u - 1, shift_v + 1) && ...
                R > R(shift_u + 1, shift_v - 1) && ...
                R > R(shift_u + 1, shift_v) && ...
                R > R(shift_u + 1, shift_v + 1) && ...
                R > R(shift_u, shift_v - 1) && ...
                R > R(shift_u, shift_v + 1))

             end                     
         end
     end
end