%Function       : convertToFixedPointValue
%Arguments      : input_number - Number to be converted to fixed point value 
%               : bit_width - Desired bit_width for the output 
%               : no_bits_for_integer_part - Number of bits required for
%                 the integer portion of the float value
%Description    : This function takes regular number and
%                 converts it to the given size of fixed point number. 
%Returns        : fixed_point_number - A fixed point value of given size
function fixed_point_number = convertToFixedPointValue(input_number,bit_width, no_bits_for_integer_part)
    
    %Error Check for number of bits 
    if((no_bits_for_integer_part + 2) > bit_width)
        disp("Please enter the valid combination of bit sizes");
        return
    end
    
    no_bits_for_decimal = bit_width - no_bits_for_integer_part - 1;  %1 bit is reserved for sign inidcations 
    
    max_decimal_val = 1 / (2^no_bits_for_decimal); 
    max_integer_val = 2^no_bits_for_integer_part; 
    
    max_val_posible = max_decimal_val + max_integer_val; 
    min_val_possible = -max_val_posible; 
    
    %Normal Condition 
    fixed_point_number = makeBitAccurateNumber(input_number, no_bits_for_decimal);
    
    %Checking for saturation 
    if(input_number > max_val_posible)
        fprintf("The value is more than the allowed limit of the given size of the fixed point representation");
        fixed_point_number = max_val_posible; 
    elseif(input_number < min_val_possible)
        fprintf("The value is lesser than the allowed limit of the given size of the fixed point representation");
        fixed_point_number = min_val_possible; 
    end
end