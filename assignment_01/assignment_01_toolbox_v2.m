function assignment_01_toolbox_v2

% Recreation of (Des)Orderes
%{
for row = 1:10
    for col = 1:10

        createRectangle(row-1, row-1, row, row, ...
                        col, col-1, col-1, col, 1, 'k', false, false, 0);
        hold on;

        for randCount = 1:10

            randNum = random('Normal', 0.1, 0.09);
            createRectangle((row-1)+randNum, (row-1)+randNum, row-randNum, row-randNum, ...
                             col-randNum, (col-1)+randNum, (col-1)+randNum, col-randNum, 1, 'k', false, false, 0);
            hold on;

        end
    end
end
%}

% Variation of (Des)Orderes
%{%}
for row = 1:10
    for col = 1:10

        createCircle(row, col, 1, 1, 'r', false);
        hold on;

        for randCount = 1:3

            randNum = random('Normal', 0.1, 0.05);

            createCircle(row, col, 1-randNum, 1, 'r', false);
            hold on;

        end
    end
end


fig = gcf;
%print(fig,'assignment_01_toolbox_replication_v2.svg','-dsvg');

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

            new_xl = new_xl - 0.1;
            new_yl = new_yl - 0.1;
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

        % centroid

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

                plot(rotate(polyshape([new_x_tl new_x_bl new_x_br new_x_tr], ...
                                      [new_y_tl new_y_bl new_y_br new_y_tr]), ...
                                      rot_angle), 'LineWidth', stroke_width, 'EdgeColor', stroke_color, 'FaceColor', 'none');

            else

                plot(polyshape([new_x_tl new_x_bl new_x_br new_x_tr], ...
                               [new_y_tl new_y_bl new_y_br new_y_tr]), ...
                               'LineWidth', stroke_width, 'EdgeColor', stroke_color, 'FaceColor', 'none');
            
            end

            hold on

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

                plot(rotate(polyshape([x_tl x_bl x_br x_tr], ...
                                      [y_tl y_bl y_br y_tr]), rot_angle),'LineWidth', stroke_width, 'EdgeColor', stroke_color, 'FaceColor', 'none');

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
    - stroke_color: color of stroke / fill
    - isFilled: determines if shape is filled or outlined
%}
function createPolygon(poly_shape, stroke_width, stroke_color, isFilled)

%{
    if (isFilled)

        stroke_width = 1;

        while (new_radius >= 0)

            plot(poly_shape, 'LineWidth', stroke_width, 'EdgeColor', stroke_color); 

        end

    else

        plot(poly_shape, 'LineWidth', stroke_width, 'EdgeColor', stroke_color);

    end
%}    
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

% ~ Path LINE ~ 
%{
    - x: x coordinates (can be an equation)
    - y: y coordinates (can be an equation)
    - stroke_width: size of stroke
    - stroke_color: color of stroke
%}
function createPathLine(x, y, stroke_width, stroke_color)

    plot(x, y, 'LineWidth', stroke_width, 'Color', stroke_color);

end
