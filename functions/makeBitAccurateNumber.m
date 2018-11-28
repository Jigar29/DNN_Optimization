%Function       : makeBitAccurateNumber
%Arguments      : input - a number to be converted into the Bitaccurate number
%               : bit_size - this is the maximum number of bits the decimal part of the number
%                 is expected accurate upto
%Description    : This function takes the input of regular float number and
%                 rounds it off to the nearest posible decimal number 
%Returns        : The Function returns the bit accurate float number 

function bit_accurate_number = makeBitAccurateNumber(input_number, bit_size)
   %Shifting the decimal point (bit_size-1) times to the left 
   integer_number = round(input_number * 2^(bit_size));
   %Shifting back the decimal point (bit_size-1) times to the right 
   bit_accurate_number = integer_number / 2^(bit_size);
end