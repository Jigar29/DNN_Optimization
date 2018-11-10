%Function       : trainTheModel
%Arguments      : to be fixed 
%Description    : This function computes the weights of the neural network
%                 with gradient descend learning algorithm 
%Returns        : to be fixed 
function trainTheModel(data, labels, weights, num_input_features, num_hidden_layers, num_labels, bit_width)

%Computing the weights 
%First Layer weights 
layer1_weights = reshape(weights(1:(num_hidden_layers*(num_input_features +1))), num_hidden_layers, (num_input_features+1)); 
%Second layer weights
layer2_weights = reshape(weights((num_hidden_layers*(num_input_features +1))+1:end), num_labels, (num_hidden_layers+1)); 


% Counting the number of examples available for training 
no_of_examples = size(data , 1);
cost = 0; 

%let us add bias column in the current data for training 
layer1_input = [ones(no_of_examples,1), data]; 
layer1_output = getSigmoidArray(layer1_input * layer1_weights'); 

%let us continue to the hidden layer now 
layer2_input = [ones(no_of_examples,1), layer1_output]; 
layer2_output = getSigmoidArray(layer2_input * layer2_weights')

%creating the label array for prediction purpose 
labels = [zeros(no_of_examples,num_labels-1), labels];        % This will add 9 columns of 0's

%We are creating the array of labels here, which will have 1 at the correct
%label and zero at rest of the labels 
for i=1:no_of_examples
    digit_no = labels(i,num_labels);
    labels(i,num_labels) = 0;
    labels(i,digit_no) = 1;
end

end

