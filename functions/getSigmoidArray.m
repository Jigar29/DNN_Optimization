%Function       : getSigmoidArray
%Arguments      : input_array - Input array to be passed into sigmoid fun
%Description    : This function returns the array of sigmoid values
%Returns        : Array of Sigmoid Values
function sigmoid_value_array = getSigmoidArray(input_array)

    %Calculating the size of the input array 
    [row, col] = size(input_array);
    
    %initializing the output array with zeros 
    sigmoid_value_array = zeros(row, col); 

    %sigmoid computation for each element of the matrix(array) 
    for i=1:row
        for j =1:col
            sigmoid_value_array(i, j) = getSigmoidValue(input_array(i,j));
        end
    end
end

