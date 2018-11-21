%Function       : initializeDebugWeights
%Arguments      : num_input  - number of inputs in the layer  
%                 num_outputs - number of outputs to the layer 
%Description    : This function creates the weights for debugging the
%                 trained neural network  
%Returns        : Debug weights  
function output_weights = initializeDebugWeights(num_inputs, num_outputs)

%Creating the array of zeros of the given size 
output_weights = zeros(num_inputs, num_outputs+1);

%Creating the sinosodual values for the weights to debug the neural network
temp_weights = sin(1:numel(output_weights)); 

%Reshaping the linear array into the given shape of the layer 
output_weights = reshape(temp_weights, size(output_weights)) / 10;
end

