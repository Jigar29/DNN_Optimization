%Function       : predictLabel
%Arguments      : theta1 : trained weights for layer1
%               : theta2 : trained weights for layer2 
%               : input_number: input of which the output is to be predicted
%Description    : This function takes input of which the outpyt is to be
%                 predicted and also the inputs of weights for both layer 
%                 and predicts the output according to the sigmoid function
%Returns        : The Function returns the bit-accurate predicted output 
function output_number = predictLabel( theta1, theta2, input_number )
    
    %calculating the size of input number and the weights for layer 2
    size_of_input = size(input_number,1);
    % label  = size(theta2, 1);
    
    %defining a variable, would be returning the prediction
    output_number = zeros(size(input_number,1), 1); 
    
    %predicting the output of layer 1
    layer_1 = getSigmoidValue([ones(size_of_input, 1) input_number] * theta1');
    
    %predicting the final output after layer 2
    layer_2 = getSigmoidValue([ones(size_of_input, 1) layer_1 * theta2');
    
    %selecting the max value of the predicted values
    output_number = max(layer_2, [], 2);
end


