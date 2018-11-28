%Function       : getSigmoidGradient
%Arguments      : array: Matrix of the values 
%Description    : tobefixed
%Returns        : output array of gradient values 
function [gradient_array] = getSigmoidGradient(array, bit_scheme_number_fptr, bit_scheme_array_fptr)

    [rows, cols] = size(array); 
    gradient_array = zeros(rows, cols);                                    %Making the array of the zeros of size of the input array 
    gradient_array = getSigmoidArray(array, bit_scheme_number_fptr).*(1-getSigmoidArray(array, bit_scheme_number_fptr));    %Computing the actual gradient of th given array 
    
    gradient_array = bit_scheme_array_fptr(gradient_array); 
end

