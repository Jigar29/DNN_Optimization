%Function       : displayImage
%Arguments      : image_Set - Image set containing multiple images 
%               : image_number - Image number from the given image set 
%Description    : This function returns the image matrix at a given image_number 
%Returns        : Image matrix
function image = getImageMatrix(image_Set, image_number)
    %Taking the zero initialized image matrix for coming up operations     
    image = zeros(20,20);
    
    %Extracting the image at given image_number from the image_set
    for i=1:20
        for j =1:20
         image(i, j) = image_Set(image_number, ((i - 1) * 20) + j);
        end
    end
end

