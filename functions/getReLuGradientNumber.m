%Function       : getReLuGradientNumber
%Arguments      : input_number
%Description    : This function calculates the ReLu gradient of the given
%                 number
%Returns        : outputs ReLu gradient of given number  
function ReLu_gradient_number = getReLuGradientNumber(input_number)
    
    %Calculating the ReLu gradient of the given number 
    if(input_number>=0)
        ReLu_gradient_number = 1;
    else
        ReLu_gradient_number = 0;
    end
end