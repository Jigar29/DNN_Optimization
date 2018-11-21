%Function       : getSigmoidGradient
%Arguments      : array: Matrix of the values 
%Description    : tobefixed
%Returns        : output array of gradient values 
function [gradient_array] = getSigmoidGradient(array, bit_width)

gradient_array = zeros(size(array));                                    %Making the array of the zeros of size of the input array 
gradient_array = getSigmoidArray(array, bit_width).*(1-getSigmoidArray(array, bit_width));    %Computing the actual gradient of th given array 
gradient_array= makeBitAccurateArray(gradient_array, bit_width);        %Making output bit accurate

end

