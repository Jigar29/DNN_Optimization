%Function       : validateNetworkGradient
%Arguments      : regularization_const
%Description    : This function computes the weights of the neural network
%                 with gradient descend learning algorithm 
%Returns        : No returns 
function validateTrainedNetworkWeights(lambda, bit_width)
    if ~exist('lambda', 'var') || isempty(lambda)
        lambda = 0;
    end

    num_input_features = 3;
    num_hidden_layers = 5; 
    num_labels = 3;
    no_of_examples = 5;

    %Creating the weights for the layers 
    layer1_weights = initializeDebugWeights(num_hidden_layers, num_input_features);
    layer2_weights = initializeDebugWeights(num_labels, num_hidden_layers);
    
    % Reusing debugInitializeWeights to generate X
    data  = initializeDebugWeights(no_of_examples, num_input_features - 1);
    labels  = 1 + mod(1:no_of_examples, num_labels)';

    % Unroll parameters
    debug_weights = [layer1_weights(:) ; layer2_weights(:)];

    % Decorator to the cost function 
    costFunc = @(p) trainTheModel(data, labels, p, num_input_features, num_hidden_layers, num_labels,lambda, bit_width);

    %Computing the original gradients and cost based on the debug weights 
    [cost, trained_weights] = costFunc(debug_weights);  
    
    %Computing the gradient based on the purtubs on the trained weights and the cost function 
    revised_weights = computeRevisedDebugWeights(costFunc, debug_weights);

    % Visually examine the two gradient computations.  The two columns you get should be very similar. 
    disp([revised_weights trained_weights]);
    fprintf('The above two columns you get should be very similar.\n (Left-Your Numerical Gradient, Right-Analytical Gradient)\n\n');

    % Evaluate the norm of the difference between two solutions.  
    diff = norm(revised_weights - trained_weights)/norm(revised_weights + trained_weights);

    fprintf(['If your backpropagation implementation is correct, then \n' ...
             'the relative difference will be small (less than 1e-9). \n' ...
             '\nRelative Difference: %g\n'], diff);

end
