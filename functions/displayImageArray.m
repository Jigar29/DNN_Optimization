%Function       : displayImageArray
%Arguments      : image_Set - Image set containing multiple images 
%               : image_numbers - Image numbers from the given image set 
%Description    : This function displays the given images from given image set 
%Returns        : void
function displayImageArray(image_Set, image_numbers)
    %Extracting the image at given image_number from the image_set 
    for i=image_numbers
        displayImage(image_Set, i);
        pause(0.005)
    end
end
