%% Quantification of Trabeculae Inside the Heart from MRI Using Fractal Analysis 

%% This code is written by-
                %Md. Kamrul Hasan, M1 MAIA
                %Md. Fakrul Islam Tushar, M1 MAIA
%%
function Filtered_Image= By_this_you_can_do_Filtering(Image_Imported, Standard_Deviation)
Sub_Mask = fspecial('gaussian', ceil(3*Standard_Deviation), Standard_Deviation);
Filtered_Image = filter2(Sub_Mask, Image_Imported, 'same');
%%               END