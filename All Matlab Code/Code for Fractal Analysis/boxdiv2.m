%% Quantification of Trabeculae Inside the Heart from MRI Using Fractal Analysis 

%% This code is written by-
                %Md. Kamrul Hasan, M1 MAIA
                %Md. Fakrul Islam Tushar, M1 MAIA
%%
function c=boxdiv2(c, p)
siz = length(c);
if siz==1
    c=true;
else
    siz2 = round(siz/2);
    % sub-square top-left
    c(1:siz2, 1:siz2) = c(1:siz2, 1:siz2) & (rand<p);
    if c(1,1)
        c(1:siz2,1:siz2) = boxdiv2(c(1:siz2,1:siz2),p);
    end
    % sub-square top-right
    c((1+siz2):siz,1:siz2) = c((1+siz2):siz,1:siz2) & (rand<p);
    if c(1+siz2,1)
        c((1+siz2):siz,1:siz2) = boxdiv2(c((1+siz2):siz,1:siz2),p);
    end
    % sub-square bottom-left
    c(1:siz2,(1+siz2):siz) = c(1:siz2,(1+siz2):siz) & (rand<p);
    if c(1,1+siz2)
        c(1:siz2,(1+siz2):siz) = boxdiv2(c(1:siz2,(1+siz2):siz),p);
    end
    % sub-square bottom-right
    c((1+siz2):siz,(1+siz2):siz) = c((1+siz2):siz,(1+siz2):siz) & (rand<p);
    if c(1+siz2,1+siz2)
        c((1+siz2):siz,(1+siz2):siz) = boxdiv2(c((1+siz2):siz,(1+siz2):siz),p);
    end
end
%%                         END