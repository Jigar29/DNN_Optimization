%Function       : trainTheModel
%Arguments      : to be fixed 
%Description    : This function computes the weights of the neural network
%                 with gradient descend learning algorithm 
%Returns        : to be fixed 
function [cost, trained_weights] = trainTheModel(data, labels, weights, num_input_features, num_hidden_layers, num_labels,lambda, bit_width)

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

%outer layer delta calculation 
outer_layer_delta = layer2_output - labels; 

%Computing the cost in this step 
error_term1 = log(layer2_output')*labels';
error_term2 = log(1-layer2_output')*(1-labels');

cost = (-error_term1 - error_term2)/no_of_examples;

%Doing the regularization of the cost function 
err1_r = sum(sum(layer1_weights(:,2:end).*layer1_weights(:,2:end)));
err2_r = sum(sum(layer2_weights(:,2:end).*layer2_weights(:,2:end)));

error = err1_r + err2_r;
cost = cost + ((lambda/(2*no_of_examples))*error);         

%BackPropagation Algorithm 
layer1_grad_derivative = getSigmoidGradient(layer1_input * layer1_weights');

hidden_layer_delta = (outer_layer_delta*layer2_weights(:,2:end)).*(layer1_grad_derivative);

%creating new trained weights 
trained_layer1_weights = zeros(size(layer1_weights));
trained_layer2_weights = zeros(size(layer2_weights));

temp_layer1_weights = ((layer1_input'*hidden_layer_delta)')/no_of_examples;                              % # 25 X 401 matrix
temp_layer2_weights = ((layer2_input'*outer_layer_delta)')/no_of_examples;                              % # 10 X 26 matrix

trained_layer1_weights(:,1) = temp_layer1_weights(:,1);
trained_layer1_weights(:,2:end) = temp_layer1_weights(:,2:end) + ((2*const)*layer1_weights(:,2:end));

trained_layer2_weights(:,1) = temp_layer2_weights(:,1);
trained_layer2_weights(:,2:end)= temp_layer2_weights(:,2:end) + ((2*const)*layer2_weights(:,2:end));

trained_weights = [trained_layer1_weights(:) ; trained_layer2_weights(:)];
end


