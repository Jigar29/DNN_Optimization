%Function       : getSigmoidValue
%Arguments      : input_number - Input number to be passed into sigmoid fun
%Description    : This function returns the sigmoid value of the given num
%Returns        : Sigmoid Value of the given number 
function output = getSigmoidValue(input_number)

    % Sigmoid function Calculation
    output = 1 /(1 + exp(-input_number));
end

