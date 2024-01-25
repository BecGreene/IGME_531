function assignment_00_ten_thousand_things_v1

    % 1
    rectangle('Position', [1.5 6 1 4], 'FaceColor', 'k', 'LineStyle','none');

    % 0
    % Starting coordinate
    base_num = 3.5;

    % Loop for 4 zeros
        for count = 1:4

            % Create two rectangles
            rectangle('Position', [(base_num) 6 4 4], 'FaceColor', 'k', 'LineStyle','none');
            rectangle('Position', [(base_num + 1) 7 2 2], 'FaceColor', 'w', 'LineStyle','none');

            % Move zeroes
            base_num = base_num + 5;

        end
    
    % T
    rectangle('Position', [1 4 4 1], 'FaceColor', 'k', 'LineStyle','none');
    rectangle('Position', [2.3 1 1.5 3], 'FaceColor', 'k', 'LineStyle','none');
    
    % H
    rectangle('Position', [6 1 1 4], 'FaceColor', 'k', 'LineStyle','none');
    rectangle('Position', [7 2.5 1 1], 'FaceColor', 'k', 'LineStyle','none');
    rectangle('Position', [8 1 1 4], 'FaceColor', 'k', 'LineStyle','none');
    
    % I
    rectangle('Position', [10 1 1 4], 'FaceColor', 'k', 'LineStyle','none');
    
    % N
    rectangle('Position', [12 1 1 4], 'FaceColor', 'k', 'LineStyle','none');
    rectangle('Position', [13 4 1 1], 'FaceColor', 'k', 'LineStyle','none');
    rectangle('Position', [14 1 1 4], 'FaceColor', 'k', 'LineStyle','none');
    
    % G
    rectangle('Position', [16 1 1 4], 'FaceColor', 'k', 'LineStyle','none');
    rectangle('Position', [17 4 2 1], 'FaceColor', 'k', 'LineStyle','none');
    rectangle('Position', [17 1 2 1], 'FaceColor', 'k', 'LineStyle','none');
    rectangle('Position', [18 2 1 1], 'FaceColor', 'k', 'LineStyle','none');
    rectangle('Position', [17.5 2.5 0.5 0.5], 'FaceColor', 'k', 'LineStyle','none');
    
    % S
    rectangle('Position', [20 1 3 1], 'FaceColor', 'k', 'LineStyle','none');
    rectangle('Position', [20 4 3 1], 'FaceColor', 'k', 'LineStyle','none');
    rectangle('Position', [20 3 1 1], 'FaceColor', 'k', 'LineStyle','none');
    rectangle('Position', [22 2 1 1], 'FaceColor', 'k', 'LineStyle','none');
    rectangle('Position', [21 3 2 0.5], 'FaceColor', 'k', 'LineStyle','none');
    
    % Create canvas
    % Size
    axis([0 25 0 11]);
    % Remove numbers
    % set(gca,'XTick',[], 'YTick', []);

end