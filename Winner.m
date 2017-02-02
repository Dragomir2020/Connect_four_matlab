
function W = Winner(location)
%Winner Code

%Compute whether winner in col
Count = 0;
W = 0;
for col = 1:7
    for row = 1:5
        if Count == 3
            %Do nothing
            break;
        elseif location(row,col) == location(row + 1,col) && location(row,col) ~= 0
            Count = Count + 1;
        else
            Count = 0;
        end
        if Count == 3
            W = 1;
        end
    end
end

% Check for winner in row
Count = 0;
for row = 1:6
    for col = 1:6
        if Count == 3
            %Do nothing
            break;
        elseif location(row,col) == location(row,col + 1) && location(row,col) ~= 0
            Count = Count + 1;
        else
            Count = 0;
        end
        if Count == 3
            W = 1;
        end
    end
end


% Check diagonal left to right 
New_Matrix = zeros(9);
New_Matrix(1:6,1:7) = location;
Location_Previous = 0;
for X = 4:9
    Diagonal = 1;
    Count = 0;
    for num = X:-1:1
        if Count == 3
            W = 1;
            continue;
        elseif Location_Previous == New_Matrix(num,Diagonal) && Location_Previous ~= 0
            Count = Count + 1;
        else
            Count = 0;
        end
        Location_Previous = New_Matrix(num,Diagonal);
        Diagonal = Diagonal + 1;
    end
    if Count == 3
        continue;
    end
end

%Check diagonal right to left
Location_Previous = 0;
for X = 6:-1:1
    Diagonal = 1;
    Count = 0;
    for num = X:9
        if Count == 3
            W = 1;
            continue;
        elseif Location_Previous == New_Matrix(num,Diagonal) && Location_Previous ~= 0
            Count = Count + 1;
        else
            Count = 0;
        end
        Location_Previous = New_Matrix(num,Diagonal);
        Diagonal = Diagonal + 1;
    end
    if Count == 3
        continue;
    end
end

end
