clear;
clc;
load Connect.mat;
% Loads Board (6x7 cell array), a redchip block, and a blackchip block
imshow([Board{1,:};Board{2,:};Board{3,:};Board{4,:};Board{5,:};Board{6,:}])
% Shows the initial board ? 6 rows and 7 columns ? initially empty (yellow)
location =  zeros(6,7); % Save location of players chips
Chip = cell(2,1);
Chip{1} = blackchip;
Chip{2} = redchip;
W = 0;
while W == 0
    for j = 1:2
        [x,y] = ginput(1);
        row = 1;
        col = floor(x/101) + 1;
        while location(row,col) == 0
            Board{row,col} = Chip{j};
            imshow([Board{1,:};Board{2,:};Board{3,:};Board{4,:};Board{5,:};Board{6,:}]);
            if row == 6
                location(row,col) = j;
                W = Winner(location);
                continue;
            elseif location(row + 1, col) == 1 || location(row + 1, col) == 2
                location(row,col) = j;
                W = Winner(location);
                continue;
            end
            Board{row,col} = BlankSquare;
            row = row + 1;
        end
        if W == 1
            disp('we have a winner');
        end
    end
end


    