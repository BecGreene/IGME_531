function assignment_01_toolbox_v1

% Replication of Sainte-Victoire

%{
createRectangle(4, 4, 18, 18, 23, 40, 40, 23, 1, '#3B100E', true, false, 30);
createRectangle(16, 16, 24, 24, 10, 21, 21, 10, 1, '#3B100E', true, false, 30);
createRectangle(15, 15, 23, 23, 20, 35, 35, 20, 1, '#A2142F', true, false, 10);
createRectangle(0, 0, 10, 10, 0, 20, 20, 0, 1, '#A2142F', true, true, 15);
createRectangle(18, 18, 25, 25, -1, 13, 13, -1, 1, '#A2142F', true, false, 45);
createRectangle(2, 2, 12, 12, 15, 30, 30, 15, 1, '#FF0000', true, false, 45);
createRectangle(18, 18, 28, 28, 15, 30, 30, 15, 1, '#FF0000', true, false, 20);
createRectangle(21, 21, 27, 27, -10, 1, 1, -10, 1, '#FF0000', true, false, 15);
%}

% Variation of Sainte-Victoire
%{%}
createCircle(1, 5, 2, 1, '#0072BD', true);
createCircle(3, 8, 2, 1, '#4DBEEE', true);
createCircle(2, 6, 2, 1, '#0000FF', true);


fig = gcf;
print(fig,'assignment_01_toolbox_replication.svg','-dsvg');

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
function createCircle(x_value, y_value, radius, stroke_width, stroke_color, isFilled)

    if (isFilled)

        stroke_width = 1;
        new_radius = radius;

        while (new_radius >= 0)

            viscircles([x_value y_value], new_radius, 'LineWidth', stroke_width, 'Color', stroke_color);
            new_radius = new_radius - 0.03;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              

        end

    else

        viscircles([x_value y_value],radius,'LineWidth', stroke_width, 'Color',stroke_color);

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
    - x_start: bottom left x coordinate
    - y_start: bottom left y coordinate
    - x_size: width
    - y_size: height
    - stroke_width: size of stroke (does not matter if shape is filled)
    - stroke_color: color of stroke / fill
    - isFilled: determines if shape is filled or outlined
    - isRotated: determines if shape is rotated
    - rot_angle: angle of rotation
%}
function createRectangle(x_bl, x_tl, x_tr, x_br, y_bl, y_tl, y_tr, y_br, stroke_width, stroke_color, isFilled, isRotated, rot_angle)
    
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

                plot(rotate(polyshape([new_x_bl new_x_tl new_x_tr new_x_br],[ new_y_bl new_y_tl new_y_tr new_y_br]), rot_angle),'LineWidth', stroke_width, 'EdgeColor', stroke_color, 'FaceColor', 'none');

            else

                plot(polyshape([new_x_bl new_x_tl new_x_tr new_x_br],[ new_y_bl new_y_tl new_y_tr new_y_br]), 'LineWidth', stroke_width, 'EdgeColor', stroke_color, 'FaceColor', 'none');
            
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

                plot(rotate(polyshape([x_bl x_tl x_tr x_br],[ y_bl y_tl y_tr y_br]), rot_angle),'LineWidth', stroke_width, 'EdgeColor', stroke_color, 'FaceColor', 'none');

            else

                plot(polyshape([x_bl x_tl x_tr x_br],[ y_bl y_tl y_tr y_br]), 'LineWidth', stroke_width, 'EdgeColor', stroke_color, 'FaceColor', 'none');
            
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
    - x_start: x coordinate (start and end)
    - y_start: y coordinate (start and end)
    - stroke_width: size of stroke
    - stroke_color: color of stroke
%}
function createStraightLine(x_value, y_value, stroke_width, stroke_color)
    
    line(x_value, y_value, 'LineWidth', stroke_width, 'Color', stroke_color);

end
