%Function       : getReLuArray
%Arguments      : input_array - Input array to be passed into ReLu fun
%Description    : This function returns the array of ReLu values
%Returns        : Array of ReLu Values
function ReLu_value_array = getReLuArray(input_array, bit_width)

    %Calculating the size of the input array 
    [row, col] = size(input_array);
    
    %initializing the output array with zeros 
    ReLu_value_array = zeros(row, col); 

    %ReLu computation for each element of the matrix(array) 
    for i=1:row
        for j =1:col
            ReLu_value_array(i, j) = getReLuValue(input_array(i,j), bit_width);
        end
    end
end
