
function project_01

%{
createRectangle(0,0,0+1,0+1,0+1,0,0,0,1,'k',false,false,0);
hold on
createRectangle(2,2,2+1,2+1,0,0,0,0+1,1,'k',false,false,0);
hold on
createRectangle(4,4,4+1,4+1,0+1,0+1,0,0+1,1,'k',false,false,0);
hold on
createRectangle(6,6,6+1,6+1,0+1,0,0+1,0+1,1,'k',false,false,0);
%}

% Variables to change size of completed piece
num_of_rows = 10;
num_of_cols = 10;

% LOOPS
% Nested for loops to get random triangle shape in grid format

%{
% Black loop
for count_1 = 0: (num_of_rows)
    for count_2 = 0: (num_of_cols)

    getRandomTri(count_1, count_2, 'k');
    hold on;

    end
end
%}


% Blue loop
for count_1 = 0.25: (num_of_rows + .25)
    for count_2 = 0.25: (num_of_cols + .25)

    getRandomTri(count_1, count_2, 'b');
    hold on;

    end
end
%{%}

%{
% Red loop
for count_1 = 0.5: (num_of_rows + .5)
    for count_2 = 0.5: (num_of_cols + .5)

    getRandomTri(count_1, count_2, 'r');
    hold on;

    end
end
%}

% Get completed image / svg file
set(gca,'XTick',[], 'YTick', [],'XColor', 'none', 'YColor', 'none');
fig = gcf;
%print(fig,'project_01_blue.svg','-dsvg');

end

% ~ RANDOM TRIANGLE FUNCTION ~
%{
    - x: x-starting point
    - y: y-starting point
    - color: color of lines
%}
function getRandomTri(x,y, color)

% Random number generator for values between 1-4    
randNum = randi([1 4],1,1);

% Based on random number, assign associated triangle and plot it
switch randNum
    case 1
        disp('rect1');
        createRectangle(x,x,x+1,x+1,y+1,y,y,y,1,color,false,false,0);
    case 2
        disp('rect2');
        createRectangle(x,x,x+1,x+1,y,y,y,y+1,1,color,false,false,0);
    case 3
        disp('rect3');
        createRectangle(x,x,x+1,x+1,y+1,y+1,y,y+1,1,color,false,false,0);
    case 4
        disp('rect4');
        createRectangle(x,x,x+1,x+1,y+1,y,y+1,y+1,1,color,false,false,0);
    otherwise
        disp('not a valid num');
        disp(randNum);
end

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
