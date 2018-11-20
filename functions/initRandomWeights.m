%Function       : randInitializeWeights
%Arguments      : row_size - number of rows in the weight matrix
%               : col_size - number of cols in the weight matrix
%Description    : Initializes the weights using the random function of the 
%                 given dimensions  
%Returns        : void
function weights = initRandomWeights(row_size, col_size)
    
    %intializing the weight matrix of zeros with the given dimensions 
    weights = zeros(col_size, 1 + row_size);

    % Creating the random weights 
    epsilon_init = 0.12;
    weights = rand(col_size, 1 + row_size) * 2 * epsilon_init - epsilon_init;
end