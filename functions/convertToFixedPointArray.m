%Function       : convertToFixedPointArray
%Arguments      : input_array - Array of input numbers to be converted into
%                 the array of fixed point value 
%               : bit_width - Desired bit_width for the output 
%               : no_bits_for_integer_part - Number of bits required for
%                 the integer portion of the float value
%Description    : This function takes the array of the regular numbers and
%                 converts them to the given size of fixed point numbers. 
%Returns        : An array of given size containing fixed point numbers 
function output_array = convertToFixedPointArray(input_array,bit_width, no_bits_for_integer_part)

    [rows, cols] = size(input_array);
    %Making the array of given inout array 
    output_array = zeros(rows, cols); 
    
    %Creating the fixed point number of the given size for each of the numbers in the given array 
    for i=1:rows
        for j=1:cols
            output_array(i, j) = convertToFixedPointValue(input_array(i,j), bit_width, no_bits_for_integer_part); 
        end
    end
end