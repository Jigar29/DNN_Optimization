%Function       : getSigmoidValue
%Arguments      : input_number - Input number to be passed into sigmoid fun
%Description    : This function returns the sigmoid value of the given num
%Returns        : Sigmoid Value of the given number 
function output = getSigmoidValue(input_number, bit_width)

    % Sigmoid function Calculation
    output = 1 /(1 + exp(-input_number));
    output = makeBitAccurateArray(output, bit_width);
end

