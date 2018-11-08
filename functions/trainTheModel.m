function [ output_args ] = trainTheModel(features, labels, weights, num_inputs, num_hidden_layers, num_labels)

%Computing the weights 

%First Layer weights 
first_layer_weight = reshape(weights(1:(num_hidden_layers*(num_inputs +1))), num_hidden_layers, (num_inputs+1)); 
%Second layer weights
second_layer_weight = reshape(weights((num_hidden_layers*(num_inputs +1))+1:end), num_labels, (num_hidden_layers+1)); 
end

