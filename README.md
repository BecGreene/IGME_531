# IGME_531

Circle
    - x_value: center of x
    - y_value: center of y
    - radius: size of circle
    - stroke_width: size of stroke (does not matter if shape is filled)
    - stroke_color: color of stroke / fill
    - isFilled: determines if shape is filled or outlined

Ellipse
    - xl: left x coordinate
    - yl: left y coordiante
    - xr: right x coordinate
    - yr: right y coordinate
    - howStretched: Determines how thin ellipse is (value between 0.01 and 0.99) (the bigger the number, the more stretched it will be)
    - howSmooth: Determines how smooth ellipse is (the bigger the number, the smoother it will be)
    - stroke_width: size of stroke (does not matter if shape is filled)
    - stroke_color: color of stroke / fill
    - isFilled: determines if shape is filled or outlined

Rectangle
    - x_bl: bottom left x coordinate
    - x_tl: top left x coordinate
    - x_tr: top right x coordinate
    - x_br: bottom right x coordinate
    - y_bl: bottom left y coordinate
    - y_tl: top left y coordinate
    - y_tr: top right y coordinate
    - y_br: bottom right y coordinate
    - stroke_width: size of stroke (does not matter if shape is filled)
    - stroke_color: color of stroke / fill
    - isFilled: determines if shape is filled or outlined
    - isRotated: determines if shape is rotated
    - rot_angle: angle of rotation

Polygon
    - poly_shape: Matrix coordinates to make polygon (use polyshape: https://www.mathworks.com/help/matlab/ref/polyshape.html)
    - stroke_width: size of stroke (does not matter if shape is filled)
    - stroke_color: color of stroke / fill
    - isFilled: determines if shape is filled or outlined

Straight Line
    - x_start: x coordinate (start and end)
    - y_start: y coordinate (start and end)
    - stroke_width: size of stroke
    - stroke_color: color of stroke
