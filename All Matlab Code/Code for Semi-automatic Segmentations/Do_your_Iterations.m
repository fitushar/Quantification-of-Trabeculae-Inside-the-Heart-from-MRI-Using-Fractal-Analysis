%% Quantification of Trabeculae Inside the Heart from MRI Using Fractal Analysis 

%% This code is written by-
                %Md. Kamrul Hasan, M1 MAIA
                %Md. Fakrul Islam Tushar, M1 MAIA
%%
function Output_Image= Do_your_Iterations(Imported_Image, Initial_Snake_COR_X,Initial_Snake_COR_Y, Controls_tension,Controls_Rigidity, Step_Size, Control_Energy, Weight_1, Weight_2,weight_3, Iterations)
N = Iterations; 
Output_Image = Imported_Image;
[Number_of_ROW,Number_of_Column] = size(Imported_Image);
Determine_E_LINE = Output_Image; 
[Gradient_in_Y_Direction,Gradient_in_X_Direction] = gradient(Output_Image);
Edge_Of_image = -1 * sqrt ((Gradient_in_X_Direction .* Gradient_in_X_Direction + Gradient_in_Y_Direction .* Gradient_in_Y_Direction)); %eedge is measured by gradient in the image
Define_Mask_1 = [-1 1]; Define_Mask_2 = [-1;1]; Define_Mask_3 = [1 -2 1]; Define_Mask_4 = [1;-2;1]; Define_Mask_5 = [1 -1;-1 1];
Output_for_Mask_1 = Do_2D_convolution(Output_Image,Define_Mask_1);
Output_for_Mask_2 = Do_2D_convolution(Output_Image,Define_Mask_2);
Output_for_Mask_3 = Do_2D_convolution(Output_Image,Define_Mask_3);
Output_for_Mask_4 = Do_2D_convolution(Output_Image,Define_Mask_4);
Output_for_Mask_5 = Do_2D_convolution(Output_Image,Define_Mask_5);

for IT_1 = 1:Number_of_ROW
    for IT_2= 1:Number_of_Column
        E_term_Will_be(IT_1,IT_2) = (Output_for_Mask_4(IT_1,IT_2)*Output_for_Mask_1(IT_1,IT_2)*Output_for_Mask_1(IT_1,IT_2) -2 *Output_for_Mask_5(IT_1,IT_2)*Output_for_Mask_1(IT_1,IT_2)*Output_for_Mask_2(IT_1,IT_2) + Output_for_Mask_3(IT_1,IT_2)*Output_for_Mask_2(IT_1,IT_2)*Output_for_Mask_2(IT_1,IT_2))/((1+Output_for_Mask_1(IT_1,IT_2)*Output_for_Mask_1(IT_1,IT_2) + Output_for_Mask_2(IT_1,IT_2)*Output_for_Mask_2(IT_1,IT_2))^1.5);
    end
end
The_Gradient = (Weight_1*Determine_E_LINE + Weight_2*Edge_Of_image -weight_3 * E_term_Will_be); 

[Gradient_in_X_Direction, Gradient_in_Y_Direction] = gradient(The_Gradient); 
Initial_Snake_COR_X=Initial_Snake_COR_X';
Initial_Snake_COR_Y=Initial_Snake_COR_Y';
[The_Row, Col_1] = size(Initial_Snake_COR_X);
[Row, Col_2] = size(Gradient_in_X_Direction);
MATrix = zeros(The_Row,The_Row);
b = [(2*Controls_tension + 6 *Controls_Rigidity) -(Controls_tension + 4*Controls_Rigidity) Controls_Rigidity];
Memory_Define = zeros(1,The_Row);
Memory_Define(1,1:3) = Memory_Define(1,1:3) + b;
Memory_Define(1,The_Row-1:The_Row) = Memory_Define(1,The_Row-1:The_Row) + [Controls_Rigidity -(Controls_tension + 4*Controls_Rigidity)]; % populating a template row
for IT_1=1:The_Row
    MATrix(IT_1,:) = Memory_Define;
    Memory_Define = circshift(Memory_Define',1)';
end
[Lower_Decomposition, UPer_Decomposition] = lu(MATrix + Step_Size .* eye(The_Row,The_Row));
Matrix_inv = inv(UPer_Decomposition) * inv(Lower_Decomposition);
for IT_1=1:N; 
    VAR_in_x = Step_Size*Initial_Snake_COR_X - Control_Energy*interp2(Gradient_in_X_Direction,Initial_Snake_COR_X,Initial_Snake_COR_Y);
    VAR_in_Y = Step_Size*Initial_Snake_COR_Y - Control_Energy*interp2(Gradient_in_Y_Direction,Initial_Snake_COR_X,Initial_Snake_COR_Y);
    Initial_Snake_COR_X = Matrix_inv * VAR_in_x;
    Initial_Snake_COR_Y = Matrix_inv * VAR_in_Y;
    imshow(Imported_Image,[]); 
    hold on;
    plot([Initial_Snake_COR_X; Initial_Snake_COR_X(1)], [Initial_Snake_COR_Y; Initial_Snake_COR_Y(1)], 'r-');
    hold off;
    pause(0.001)    
end;
%%                             END
