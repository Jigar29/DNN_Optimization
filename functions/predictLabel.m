%Function       : predictLabel
%Arguments      : theta1 : trained weights for layer1
%               : theta2 : trained weights for layer2 
%               : examples: example set to be predicted 
%Description    : This function takes input of which the outpyt is to be
%                 predicted and also the inputs of weights for both layer 
%                 and predicts the output according to the sigmoid function
%Returns        : The Function returns the bit-accurate predicted output 
function predicted_label = predictLabel( layer1_weights, layer2_weights, data, bit_width)
    
    %calculating the size of input number and the weights for layer 2
    size_of_input = size(data,1);
    
    %defining a variable, would be returning the prediction
    predicted_label = zeros(size_of_input, 1); 
    
    %predicting the output of layer 1
    layer1_output = getSigmoidArray(([ones(size_of_input, 1) data] * layer1_weights'), bit_width);
    
    %predicting the final output after layer 2
    layer2_output = getSigmoidArray(([ones(size_of_input, 1) layer1_output] * layer2_weights'), bit_width);
    
    %selecting the max value of the predicted values
    [dummy, predicted_label] = max(layer2_output, [], 2);
end


