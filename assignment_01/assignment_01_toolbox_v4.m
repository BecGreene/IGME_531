
function assignment_01_toolbox_v4

%{
% r = a + (b-a).*rand(N,1)
r = randi([-1,1],5,5);

x = linspace(r,r);
y = linspace(r,r); 
[X,Y] = meshgrid(x,y);
createStraightLine(X,Y,1,'k');
%plot(X,Y,'|r');
%}

%{
randNum_x1 = 0 + (2-0).*rand(1,1);
randNum_x2 = 0 + (1-0).*rand(1,1);
randNum_y1 = 0 + (1-0).*rand(1,1);
randNum_y2 = 0 + (1-0).*rand(1,1);

x = linspace(randNum_x1,randNum_x2);
y = linspace(randNum_y1,randNum_y2); 
[X,Y] = meshgrid(x,y);
createStraightLine(X,Y,1,'k');
%plot(X,Y,'|r');
%}

%{
x = -5:1:5; N = numel(x);
X = ones(N,1)*x;
Y = X + X';
plot(X',Y');
grid
%}

% Perlin noise stuff
%{
n = 64;
m = 64;
im = zeros(n, m);
im = perlinNoise(im);
%}

% Variation of Interruptions

for col_1 = 1:20
    for row_1 = 1:20

        x_start = col_1 + (col_1-row_1)*rand(1,1);
        x_end = col_1 + (col_1-row_1)*rand(1,1);
        y_start = col_1 + (col_1-row_1)*rand(1,1);
        y_end = col_1 + (col_1-row_1)*rand(1,1);

        createStraightLine([x_start,x_end], [y_start,y_end], 1, 'k');

    end
end


for row_2 = 1:20
    for col_2 = 1:20

        x_start = row_2 - (row_2-col_2)*rand(1,1);
        x_end = row_2 - (row_2-col_2)*rand(1,1);
        y_start = row_2 - (row_2-col_2)*rand(1,1);
        y_end = row_2 - (row_2-col_2)*rand(1,1);

        createStraightLine([x_start,x_end], [y_start,y_end], 1, 'k');

    end
end

%}%{

% Variation (Version 2) of Interruptions
%{
for col = 1:20
    for row = 1:20

        if (row > col)
            x_start = col + (col-row)*rand(1,1);
            x_end = col + (col-row)*rand(1,1);
            y_start = col + (col-row)*rand(1,1);
            y_end = col + (col-row)*rand(1,1);
        else
            x_start = row + (row-col)*rand(1,1);
            x_end = row + (row-col)*rand(1,1);
            y_start = row + (row-col)*rand(1,1);
            y_end = row + (row-col)*rand(1,1);
        end

        createStraightLine([x_start,x_end], [y_start,y_end], 1, 'k');

    end
end
%}

%fig = gcf;
%print(fig,'assignment_01_toolbox_replication_v4_02.svg','-dsvg');

end

% ~ CIRCLE ~ 
%{
    - x_value: center of x
    - y_value: center of y
    - radius: size of circle
    - stroke_width: size of stroke (does not matter if shape is filled)
    - stroke_color: color of stroke / fill
    - isFilled: determines if shape is filled or outlined
%}
function createCircle(x, y, radius, stroke_width, stroke_color, isFilled)

    if (isFilled)

        stroke_width = 1;
        new_radius = radius;

        while (new_radius >= 0)

            viscircles([x y], new_radius, 'LineWidth', stroke_width, 'Color', stroke_color);
            new_radius = new_radius - 0.03;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              

        end

    else

        viscircles([x y],radius,'LineWidth', stroke_width, 'Color',stroke_color);

    end

end

% ~ Ellipse ~ 
%{
    - xl: left x coordinate
    - yl: left y coordiante
    - xr: right x coordinate
    - yr: right y coordinate
    - howStretched: Determines how thin ellipse is (value between 0.01 and
        0.99) (the bigger the number, the more stretched it will be)
    - howSmooth: Determines how smooth ellipse is (the bigger the number,
        the smoother it will be)
    - stroke_width: size of stroke (does not matter if shape is filled)
    - stroke_color: color of stroke / fill
    - isFilled: determines if shape is filled or outlined

%}
function createEllipse(xl, yl, xr, yr, howStretched, howSmooth, stroke_width, stroke_color, isFilled)

% Ellipse math: https://www.mathworks.com/matlabcentral/answers/86615-how-to-plot-an-ellipse

    if (isFilled)

        stroke_width = 1;

        center_width = (xl + xr) / 2;
        center_height = (yl + yr) / 2;

        new_xl = xl;
        new_yl = yl;
        new_xr = xr;
        new_yr = yr;

        while (new_xr >= center_width || new_yr >= center_height)

            a = (1/2) * sqrt((new_xr - new_xl) ^ 2 + (new_yr - new_yl) ^ 2);
            b = a * sqrt(1-howStretched^2);
            t = linspace(0, 2 * pi, howSmooth); % Absolute angle parameter
            X = a * cos(t);
            Y = b * sin(t);

            % Compute angles relative to (x1, y1).
            angles = atan2(new_yr - new_yl, new_xr - new_xl);
            x = (new_xl + new_xr) / 2 + X * cos(angles) - Y * sin(angles);
            y = (new_yl + new_yr) / 2 + X * sin(angles) + Y * cos(angles);
        
            plot(x,y,'LineWidth', stroke_width, 'Color', stroke_color);

            hold on

            new_xl = new_xl + 0.1;
            new_yl = new_yl + 0.1;
            new_xr = new_xr - 0.1;
            new_yr = new_yr - 0.1;

        end

    else

        a = (1/2) * sqrt((xr - xl) ^ 2 + (yr - yl) ^ 2);
        b = a * sqrt(1-howStretched^2);
        t = linspace(0, 2 * pi, howSmooth); % Absolute angle parameter
        X = a * cos(t);
        Y = b * sin(t);
        % Compute angles relative to (x1, y1).
        angles = atan2(yr - yl, xr - xl);
        x = (xl + xr) / 2 + X * cos(angles) - Y * sin(angles);
        y = (yl + yr) / 2 + X * sin(angles) + Y * cos(angles);
    
        plot(x,y,'LineWidth', stroke_width, 'Color', stroke_color);

    end

end

% ~ RECTANGLE ~ 
%{
    - x_tl: top left x coordinate
    - x_bl: bottom left x coordinate
    - x_br: bottom right x coordinate
    - x_tr: top right x coordinate
    - y_tl: top left y coordinate
    - y_bl: bottom left y coordinate
    - y_br: bottom right y coordinate
    - y_tr: top right y coordinate
    - stroke_width: size of stroke (does not matter if shape is filled)
    - stroke_color: color of stroke / fill
    - isFilled: determines if shape is filled or outlined
    - isRotated: determines if shape is rotated
    - rot_angle: angle of rotation (number does not matter if rotation is
        false)
%}
function createRectangle(x_tl, x_bl, x_br, x_tr, y_tl, y_bl, y_br, y_tr, stroke_width, stroke_color, isFilled, isRotated, rot_angle)
    
    if (isFilled)

        stroke_width = 1;

        center_width = (x_bl + x_br) / 2;
        center_height = (y_bl + y_tl) / 2;

        new_x_bl = x_bl;
        new_y_bl = y_bl;
        new_x_tr = x_tr;
        new_y_tr = y_tr;
        new_x_br = x_br;
        new_y_br = y_br;
        new_x_tl = x_tl;
        new_y_tl = y_tl;

        while (new_x_tr >= center_width || new_y_tr >= center_height)

            if (isRotated)

                rotation(polyshape([new_x_tl new_x_bl new_x_br new_x_tr], ...
                                   [new_y_tl new_y_bl new_y_br new_y_tr]), ...
                                   'LineWidth', stroke_width, 'EdgeColor', stroke_color, 'FaceColor', 'none'), rot_angle;

            else

                plot(polyshape([new_x_tl new_x_bl new_x_br new_x_tr], ...
                               [new_y_tl new_y_bl new_y_br new_y_tr]), ...
                               'LineWidth', stroke_width, 'EdgeColor', stroke_color, 'FaceColor', 'none');

            end

            hold on;

            new_x_bl = new_x_bl + 0.01;
            new_y_bl = new_y_bl + 0.01;
            new_x_tr = new_x_tr - 0.01;
            new_y_tr = new_y_tr - 0.01;
            new_x_br = new_x_br - 0.01;
            new_y_br = new_y_br + 0.01;
            new_x_tl = new_x_tl + 0.01;
            new_y_tl = new_y_tl - 0.01;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               

        end
    else

        if (isRotated)

            rotation(polyshape([x_tl x_bl x_br x_tr], ...
                               [y_tl y_bl y_br y_tr]), ...
                               'LineWidth', stroke_width, 'EdgeColor', stroke_color, 'FaceColor', 'none'), rot_angle;
        else

            plot(polyshape([x_tl x_bl x_br x_tr], ...
                           [y_tl y_bl y_br y_tr]), ...
                           'LineWidth', stroke_width, 'EdgeColor', stroke_color, 'FaceColor', 'none');
        end

    end

end

% ~ POLYGON ~
%{
    - poly_shape: Matrix coordinates to make polygon (use polyshape:
        https://www.mathworks.com/help/matlab/ref/polyshape.html)
    - stroke_width: size of stroke (does not matter if shape is filled)
    - stroke_color: color of stroke
%}
function createPolygon(poly_shape, stroke_width, stroke_color)

    plot(poly_shape, 'LineWidth', stroke_width, 'EdgeColor', stroke_color);

end

% ~ STRAIGHT LINE ~ 
%{
    - x: x coordinate (start and end)
    - y: y coordinate (start and end)
    - stroke_width: size of stroke
    - stroke_color: color of stroke
%}
function createStraightLine(x, y, stroke_width, stroke_color)
    
    line(x, y, 'LineWidth', stroke_width, 'Color', stroke_color);

end

% ~ POLY LINE ~ 
%{
    - positionArray: takes array of x and y coordinates
    - stroke_width: size of stroke
    - stroke_color: color of stroke
%}
function createPolyLine(positionArray, stroke_width, stroke_color)

    drawpolyline("Position", positionArray, "LineWidth", stroke_width, "Color", stroke_color);

end

% ~ PATH LINE ~ 
%{
    - x: x coordinates (can be an equation)
    - y: y coordinates (can be an equation)
    - stroke_width: size of stroke
    - stroke_color: color of stroke
%}
function createPathLine(x, y, stroke_width, stroke_color)

    plot(x, y, 'LineWidth', stroke_width, 'Color', stroke_color);

end

% ~ TRANSLATION ~
%{
    - shape: assigned shape
    - x: translate along x axis
    - y: translate along y axis
%}
function translation(shape, x, y)

    translate(shape, [x,y]);

end

% ~ ROTATION ~
%{
    - shape: assigned shape
    - rot_angle: rotation around the default z-axis
%}
function rotation(shape, rot_angle)

    rotate(shape, rot_angle);

end

% ~ SCALING ~
%{
    - shape: assigned shape
    - x: scale along x axis
    - y: scale along y axis
%}
function scaling(shape, x, y)

    scale(shape, [x,y]);

end

% ~ RANDOM NUMBER ~
function randomNumber(min, max)

    max + (min-max)*rand(1,1);

end

% ~ PERLIN NOISE ~
function im = perlinNoise(im)

% Perlin noise code: https://stackoverflow.com/questions/7347111/generate-procedural-perlin-noise-in-matlab

    [n, m] = size(im);
    i = 0;
    w = sqrt(n*m);

    while w > 3
        i = i + 1;
        d = interp2(randn(n, m), i-1, 'spline');
        im = im + i * d(1:n, 1:m);
        w = w - ceil(w/2 - 1);
    end

    figure; 
    imagesc(im); 
    colormap gray;

end

% ~ WORLEY NOISE ~
function worleyNoise()

    voronoi(x,y);
    
end
