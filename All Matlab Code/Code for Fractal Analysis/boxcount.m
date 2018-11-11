%% Quantification of Trabeculae Inside the Heart from MRI Using Fractal Analysis 

%% This code is written by-
                %Md. Kamrul Hasan, M1 MAIA
                %Md. Fakrul Islam Tushar, M1 MAIA
%%
function [Number_of_BOX,BOX_Size] = boxcount(c,varargin)
error(nargchk(1,2,nargin));
% check for true color image (m-by-n-by-3 array)
if ndims(c)==3
    if size(c,3)==3 && size(c,1)>=8 && size(c,2)>=8
        c = sum(c,3);
    end
end
c = logical(squeeze(c));
dim = ndims(c); % dim is 2 for a vector or a matrix, 3 for a cube
if dim>3
    error('Maximum dimension is 3.');
end
% transpose the vector to a 1-by-n vector
if length(c)==numel(c)
    dim=1;
    if size(c,1)~=1   
        c = c';
    end   
end
width = max(size(c));    % largest size of the box
p = log(width)/log(2);   % nbre of generations
if p~=round(p) || any(size(c)~=width)
    p = ceil(p);
    width = 2^p;
    switch dim
        case 1
            mz = zeros(1,width);
            mz(1:length(c)) = c;
            c = mz;
        case 2
            mz = zeros(width, width);
            mz(1:size(c,1), 1:size(c,2)) = c;
            c = mz;
        case 3
            mz = zeros(width, width, width);
            mz(1:size(c,1), 1:size(c,2), 1:size(c,3)) = c;
            c = mz;            
    end
end
Number_of_BOX=zeros(1,p+1); 
switch dim
    case 1        
        Number_of_BOX(p+1) = sum(c);
        for g=(p-1):-1:0
            siz = 2^(p-g);
            siz2 = round(siz/2);
            for i=1:siz:(width-siz+1)
                c(i) = ( c(i) || c(i+siz2));
            end
            Number_of_BOX(g+1) = sum(c(1:siz:(width-siz+1)));
        end
    case 2         
        Number_of_BOX(p+1) = sum(c(:));
        for g=(p-1):-1:0
            siz = 2^(p-g);
            siz2 = round(siz/2);
            for i=1:siz:(width-siz+1)
                for j=1:siz:(width-siz+1)
                    c(i,j) = ( c(i,j) || c(i+siz2,j) || c(i,j+siz2) || c(i+siz2,j+siz2) );
                end
            end
            Number_of_BOX(g+1) = sum(sum(c(1:siz:(width-siz+1),1:siz:(width-siz+1))));
        end
    case 3         
        Number_of_BOX(p+1) = sum(c(:));
        for g=(p-1):-1:0
            siz = 2^(p-g);
            siz2 = round(siz/2);
            for i=1:siz:(width-siz+1),
                for j=1:siz:(width-siz+1),
                    for k=1:siz:(width-siz+1),
                        c(i,j,k)=( c(i,j,k) || c(i+siz2,j,k) || c(i,j+siz2,k) ...
                            || c(i+siz2,j+siz2,k) || c(i,j,k+siz2) || c(i+siz2,j,k+siz2) ...
                            || c(i,j+siz2,k+siz2) || c(i+siz2,j+siz2,k+siz2));
                    end
                end
            end
            Number_of_BOX(g+1) = sum(sum(sum(c(1:siz:(width-siz+1),1:siz:(width-siz+1),1:siz:(width-siz+1)))));
        end
end
Number_of_BOX = Number_of_BOX(end:-1:1);
BOX_Size = 2.^(0:p); 
if any(strncmpi(varargin,'slope',1))
    s=-gradient(log(Number_of_BOX))./gradient(log(BOX_Size));
    semilogx(BOX_Size, s, 's-');
    ylim([0 dim]);
    xlabel('r, Box Size'); ylabel('- d ln n / d ln r, Local Dimension');
    title('Local FD VS Box Size');
    grid on
elseif nargout==0 || any(strncmpi(varargin,'plot',1))
    loglog(BOX_Size,Number_of_BOX,'s-');
    xlabel('r, Box Size'); ylabel('n(r), Number of Boxes');
    title('Number of Boxes VS Box Size');
    grid on;
end
if nargout==0
    clear Number_of_BOX
    clear BOX_Size
end
%%                          END
