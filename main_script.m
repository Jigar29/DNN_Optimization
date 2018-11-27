%Clearing the environment 
clc; 
clear all; 

%Adding search paths to the directory 
addpath('functions', 'dataset'); 

%loading the dataset 
load('mnist_data20x20.mat');

% Setup the parameters you will use for this exercise
num_input_features  = 400;  % 20x20 Input Images of Digits
num_hidden_layers = 25;     % 25 hidden units
num_labels = 10;            % 10 labels, from 1 to 10   
                            % (note that we have mapped "0" to label 10)
bit_width = 12;             % Desired bit width of the weights

% Load Training Data
fprintf('Loading and Visualizing Data ...\n')

no_of_examples = size(X, 1);
figure; 
displayImageArray(X, 4000:4100);

fprintf('\nLoading Saved Neural Network Parameters ...\n')

% Load the weights into variables Theta1 and Theta2
load('weights.mat');

% Unroll parameters 
weights = [layer1_weights(:) ; layer2_weights(:)];

fprintf('\nFeedforward Using Neural Network ...\n')

% Weight regularization parameter (we set this to 0 here).
lambda = 0;

cost = trainTheModel(X, y, weights, num_input_features, num_hidden_layers, num_labels,lambda, bit_width);

fprintf(['Cost at parameters (loaded from ex4weights): %f '...
         '\n(this value should be about 0.287629)\n'], cost);

fprintf('\nChecking Cost Function (w/ Regularization) ... \n')

% Weight regularization parameter (we set this to 1 here).
lambda = 1;

cost = trainTheModel(X, y, weights, num_input_features, num_hidden_layers, num_labels,lambda, bit_width);

fprintf(['Cost at parameters (loaded from ex4weights): %3.18f '...
         '\n(this value should be about 0.383770)\n'], cost);

fprintf('Program paused. Press enter to continue.\n');

fprintf('\nEvaluating sigmoid gradient...\n')

gradients = getSigmoidGradient([-1 -0.5 0 0.5 1], bit_width);
fprintf('Sigmoid gradient evaluated at [-1 -0.5 0 0.5 1]:\n  ');
fprintf('%f ', gradients);
fprintf('\n\n');

fprintf('\nInitializing Neural Network Parameters ...\n')

initial_layer1_weights = initRandomWeights(num_input_features, num_hidden_layers);
initial_layer2_weights = initRandomWeights(num_hidden_layers, num_labels);

% Unroll parameters
intial_weights = [initial_layer1_weights(:) ; initial_layer2_weights(:)];

fprintf('\nChecking Backpropagation... \n');

%  Check gradients by running checkNNGradients
validateTrainedNetworkWeights(0, bit_width);

fprintf('\nProgram paused. Press enter to continue.\n');

fprintf('\nChecking Backpropagation (w/ Regularization) ... \n')

%  Check gradients by running checkNNGradients
lambda = 3;
validateTrainedNetworkWeights(lambda, bit_width);

% Also output the costFunction debugging values
debug_cost = trainTheModel(X, y, weights, num_input_features, num_hidden_layers, num_labels,lambda, bit_width);


fprintf(['\n\nCost at (fixed) debugging parameters (w/ lambda = %f): %3.18f ' ...
         '\n(for lambda = 3, this value should be about 0.576051)\n\n'], lambda, debug_cost);

fprintf('\nTraining Neural Network... \n')

%  After you have completed the assignment, change the MaxIter to a larger
%  value to see how more training helps.
options = optimset('MaxIter', 50);

%  You should also try different values of lambda
lambda = 1;

% Create "short hand" for the cost function to be minimized
costFunction = @(p) trainTheModel(X, y, p, num_input_features, num_hidden_layers, num_labels,lambda, bit_width);

% Now, costFunction is a function that takes in only one argument (the
% neural network parameters)
[weights, cost] = fmincg(costFunction, intial_weights, options);

% Obtain Theta1 and Theta2 back from nn_params
layer1_weights = reshape(weights(1:num_hidden_layers * (num_input_features + 1)), ...
                 num_hidden_layers, (num_input_features + 1));

layer2_weights = reshape(weights((1 + (num_hidden_layers * (num_input_features + 1))):end), ...
                 num_labels, (num_hidden_layers + 1));
             
fprintf('\nVisualizing Neural Network... \n')

figure; 
displayData(layer1_weights(:, 2:end));

fprintf('\nProgram paused. Press enter to continue.\n');

pred = predictLabel(layer1_weights, layer2_weights, X, bit_width);

fprintf('\nTraining Set Accuracy: %f\n', mean(double(pred == y)) * 100);