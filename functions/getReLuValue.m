%Function       : getReLuValue
%Arguments      : input_number - Input number to be passed into ReLu fun
%Description    : This function returns the ReLu value of the given num
%Returns        : ReLu value of the given number 
function output = getReLuValue(input_number, bit_scheme_number_fptr)
    % ReLu function Calculation
    if input_number >= 0
        output = input_number;
    else
        output = 0;
    
    end
    
    output= bit_scheme_number_fptr(output); 
end