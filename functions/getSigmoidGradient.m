%Function       : getSigmoidGradient
%Arguments      : array: Matrix of the values 
%Description    : tobefixed
%Returns        : output array of gradient values 
function [gradient_array] = getSigmoidGradient(array)

gradient_array = zeros(size(array));                    %Making the array of the zeros of size of the input array 
gradient_array = sigmoid(array).*(1-sigmoid(array));    %Computing the actual gradient of th given array 

end

