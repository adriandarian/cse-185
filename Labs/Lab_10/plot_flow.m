function plot_flow(img, u, v)

    u = u(1:10:end, 1:10:end);
    v = v(1:10:end, 1:10:end);

    [X, Y] = meshgrid(1:size(img, 2), 1:size(img, 1));
    X = X(1:10:end, 1:10:end);
    Y = Y(1:10:end, 1:10:end);

    figure, imshow(img);
    hold on;
    % draw the velocity vectors
    quiver(X, Y, u, v, 'y');
    drawnow;
    hold off;

end