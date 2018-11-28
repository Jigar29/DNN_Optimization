%Function       : getReLuGradientArray
%Arguments      : input_array
%Description    : This function calculates the ReLu gradient for the given
%                 array numbers
%Returns        : outputs the array of ReLu gradient of given numbers 
function output_array = getReLuGradientArray(input_array)
    [rows, cols] = size(input_array); 
    
    %Initializing an empty array of the given size 
    output_array = zeros(rows, cols); 
    
    %Calculating the ReLu gradient for each number in the array 
    for i=1:rows
        for j=1:cols
            output_array(i, j) = getReLuGradientNumber(input_array(i,j));
        end 
    end
end