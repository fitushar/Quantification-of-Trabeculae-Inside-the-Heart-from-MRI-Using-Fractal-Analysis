%% Quantification of Trabeculae Inside the Heart from MRI Using Fractal Analysis 

%% This code is written by-
                %Md. Kamrul Hasan, M1 MAIA
                %Md. Fakrul Islam Tushar, M1 MAIA
%%
function [Initial_Position_X, Initial_position_Y] = CLICK_FOR_Snake(DUMMY)
hold on;       
Initial_Position_X = [];
Initial_position_Y = [];
Dummy_VARiable = 1;
hold on
VAR_3 = [];
Iterator = 0;
disp('This is the guideline, How to select the POINT..')
disp('--> By Clicking the left mouse Button You can select the Point.')
disp('--> By Clicking the Right mouse Button You can select the LAST Point.')
Dummy_VARiable = 1;
while Dummy_VARiable == 1
    [VAR_1,VAR_2,Dummy_VARiable] = ginput(1);
    plot(VAR_1,VAR_2,'ro')
    Iterator= Iterator+1;
    VAR_3(:,Iterator) = [VAR_1;VAR_2];
end
Iterator = Iterator+1;
VAR_3(:,Iterator) = [VAR_3(1,1);VAR_3(2,1)];
Terminator = 1:Iterator;
Time_in_Sec = 1: 0.1: Iterator;
VAR_4 = spline(Terminator,VAR_3,Time_in_Sec);
Initial_Position_X = VAR_4(1,:);
Initial_position_Y = VAR_4(2,:);
%%                      END
