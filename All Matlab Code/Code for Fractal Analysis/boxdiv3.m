%% Quantification of Trabeculae Inside the Heart from MRI Using Fractal Analysis 

%% This code is written by-
                %Md. Kamrul Hasan, M1 MAIA
                %Md. Fakrul Islam Tushar, M1 MAIA
%%
function c=boxdiv3(c,p)
siz = length(c);
if siz==1
    c=true;
else
    siz2 = round(siz/2);

    % sub-cube top-left  front
    c(1:siz2,1:siz2,1:siz2) = c(1:siz2,1:siz2,1:siz2) & (rand<p);
    if c(1,1,1)
        c(1:siz2,1:siz2,1:siz2) = boxdiv3(c(1:siz2,1:siz2,1:siz2),p);
    end

    % sub-cube top-right  front
    c((1+siz2):siz,1:siz2,1:siz2) = c((1+siz2):siz,1:siz2,1:siz2) & (rand<p);
    if c(1+siz2,1,1)
        c((1+siz2):siz,1:siz2,1:siz2) = boxdiv3(c((1+siz2):siz,1:siz2,1:siz2),p);
    end

    % sub-cube bottom-left  front
    c(1:siz2,(1+siz2):siz,1:siz2) = c(1:siz2,(1+siz2):siz,1:siz2) & (rand<p);
    if c(1,1+siz2,1)
        c(1:siz2,(1+siz2):siz,1:siz2) = boxdiv3(c(1:siz2,(1+siz2):siz,1:siz2),p);
    end

    % sub-cube bottom-right  front
    c((1+siz2):siz,(1+siz2):siz,1:siz2) = c((1+siz2):siz,(1+siz2):siz,1:siz2) & (rand<p);
    if c(1+siz2,1+siz2,1)
        c((1+siz2):siz,(1+siz2):siz,1:siz2) = boxdiv3(c((1+siz2):siz,(1+siz2):siz,1:siz2),p);
    end

    % sub-cube top-left  bottom
    c(1:siz2,1:siz2,(1+siz2):siz) = c(1:siz2,1:siz2,(1+siz2):siz) & (rand<p);
    if c(1,1,1+siz2)
        c(1:siz2,1:siz2,(1+siz2):siz) = boxdiv3(c(1:siz2,1:siz2,(1+siz2):siz),p);
    end

    % sub-cube top-right  bottom
    c((1+siz2):siz,1:siz2,(1+siz2):siz) = c((1+siz2):siz,1:siz2,(1+siz2):siz) & (rand<p);
    if c(1+siz2,1,1+siz2)
        c((1+siz2):siz,1:siz2,(1+siz2):siz) = boxdiv3(c((1+siz2):siz,1:siz2,(1+siz2):siz),p);
    end

    % sub-cube bottom-left  bottom
    c(1:siz2,(1+siz2):siz,(1+siz2):siz) = c(1:siz2,(1+siz2):siz,(1+siz2):siz) & (rand<p);
    if c(1,1+siz2,1+siz2)
        c(1:siz2,(1+siz2):siz,(1+siz2):siz) = boxdiv3(c(1:siz2,(1+siz2):siz,(1+siz2):siz),p);
    end

    % sub-cube bottom-right  bottom
    c((1+siz2):siz,(1+siz2):siz,(1+siz2):siz) = c((1+siz2):siz,(1+siz2):siz,(1+siz2):siz) & (rand<p);
    if c(1+siz2,1+siz2,1+siz2)
        c((1+siz2):siz,(1+siz2):siz,(1+siz2):siz) = boxdiv3(c((1+siz2):siz,(1+siz2):siz,(1+siz2):siz),p);
    end
end
%%             END