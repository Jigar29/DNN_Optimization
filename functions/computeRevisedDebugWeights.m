%Function       : computeDebugGradients
%Arguments      : cost_function_ptr - function pointer to the cost function
%                 trained_weights   - Copy of the weights of the trained neural network 
%Description    : This function gives the new gradients based on the
%                 +pertub and -pertub added to the trained weights  
%Returns        : new_gradient -  values after adding pertub values  
function new_gradient = computeRevisedDebugWeights(cost_function_ptr, trained_weights)

    %Intializing the output matrix and the pertub matrix to zeros 
    new_gradient = zeros(size(trained_weights));
    perturb = zeros(size(trained_weights));
    
    for i = 1:numel(trained_weights)
        % Set perturbation vector
        perturb(i) = 1e-4;
        
        %Calculating the loss 
        loss1 = cost_function_ptr(trained_weights - perturb);
        loss2 = cost_function_ptr(trained_weights + perturb);
        
        % Compute Numerical Gradient
        new_gradient(i) = (loss2 - loss1) / (2*perturb(i));
        perturb(i) = 0;
    end
end

