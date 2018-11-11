%% Quantification of Trabeculae Inside the Heart from MRI Using Fractal Analysis 

%% This code is written by-
                %Md. Kamrul Hasan, M1 MAIA
                %Md. Fakrul Islam Tushar, M1 MAIA
%%
function convolution_output=Do_2D_convolution(First_Mat,Second_Mat)
[row_First_Mat,column_First_Mat] = size(First_Mat);
[row_Second_Mat,column_Second_Mat] = size(Second_Mat);
h = rot90(Second_Mat, 2);
center = floor((size(h)+1)/2);
left = center(2) - 1;
right = column_Second_Mat - center(2);
top = center(1) - 1;
bottom = row_Second_Mat - center(1);
Rep = zeros(row_First_Mat + top + bottom, column_First_Mat + left + right);
for Iterator_1 = 1 + top : row_First_Mat + top
    for Iterator_2 = 1 + left : column_First_Mat + left
        Rep(Iterator_1,Iterator_2) = First_Mat(Iterator_1 - top, Iterator_2 - left);
    end
end
convolution_output  = zeros(row_First_Mat , column_First_Mat);
for Iterator_1 = 1 : row_First_Mat
    for Iterator_2 = 1 : column_First_Mat
        for IT_1 = 1 : row_Second_Mat
            for IT_2 = 1 : column_Second_Mat
                IT_3 = Iterator_1 - 1;
                IT_4 = Iterator_2 -1;
                convolution_output (Iterator_1, Iterator_2) = convolution_output (Iterator_1, Iterator_2) + (Rep(IT_1 + IT_3, IT_2 + IT_4) * h(IT_1, IT_2));
            end
        end
    end
end
end
%%                                 END