%% Quantification of Trabeculae Inside the Heart from MRI Using Fractal Analysis 

%% This code is written by-
                %Md. Kamrul Hasan, M1 MAIA
                %Md. Fakrul Islam Tushar, M1 MAIA
%%
function c = randcantor(p,n,d,varargin)
error(nargchk(1,4,nargin));

if nargin==1
    n = 256;
    d = 2;
elseif nargin==2
    d = 2;
end
switch d
    case 1, c = boxdiv1(true(1,n),p);
    case 2, c = boxdiv2(true(n,n),p);
    case 3, c = boxdiv3(true(n,n,n),p);
    otherwise, error('Dimension should be 1, 2, or 3.');
end
if nargout==0 || any(strncmpi(varargin,'show',1))
    switch d
        case 1
            imagesc(~c);
            set(gca,'PlotBoxAspectRatio',[40 1 1]);
            set(gca,'TickLength',[0 0]);
            set(gca,'YTick',[]);
            colormap gray
        case 2
            imagesc(~c);
            axis image
            colormap gray
        case 3
            warning('No display of 3D sets. Use the syntax C = BOXDIV(...)');
    end
end;

if nargout==0
    clear c
end
%%                   END
