%Function       : makeBitAccurateArray
%Arguments      : input_array- an array to be converted into the
%                  Bitaccurate array
%               : bit_size - this is the maximum number of bits the number
%                 is expected to represented in
%Description    : This function takes the input of regular float array and
%                 rounds it off to the nearest posible decimal array 
%Returns        : The Function returns the bit accurate float array 

function bit_accurate_array = makeBitAccurateArray(input_array, bit_width)
    
    % Extracting the array size 
    [rows, cols] = size(input_array);
    
    % Creating an output array 
    bit_accurate_array = zeros(rows, cols); 
    
    %Calculating the bit accurate number for each element of the array 
    for i= 1:rows
        for j=1:cols
            bit_accurate_array(i,j) = makeBitAccurateNumber(input_array(i,j), bit_width); 
        end
    end
end

