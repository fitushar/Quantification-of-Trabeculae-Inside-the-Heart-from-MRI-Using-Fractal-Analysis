function varargout = IMAGE_LOAD(varargin)
% IMAGE_LOAD MATLAB code for IMAGE_LOAD.fig
%      IMAGE_LOAD, by itself, creates a new IMAGE_LOAD or raises the existing
%      singleton*.
%
%      H = IMAGE_LOAD returns the handle to a new IMAGE_LOAD or the handle to
%      the existing singleton*.
%
%      IMAGE_LOAD('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in IMAGE_LOAD.M with the given input arguments.
%
%      IMAGE_LOAD('Property','Value',...) creates a new IMAGE_LOAD or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before IMAGE_LOAD_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to IMAGE_LOAD_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help IMAGE_LOAD

% Last Modified by GUIDE v2.5 05-Jan-2018 03:37:08

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @IMAGE_LOAD_OpeningFcn, ...
                   'gui_OutputFcn',  @IMAGE_LOAD_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before IMAGE_LOAD is made visible.
function IMAGE_LOAD_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to IMAGE_LOAD (see VARARGIN)

% Choose default command line output for IMAGE_LOAD
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes IMAGE_LOAD wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = IMAGE_LOAD_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] = uigetfile({'*.dcm*'}, 'Pick an Image File');
img=dicomread(dicominfo([pathname,filename]));
axes(handles.img_display);
imshow(img,[]);
%% Binary Image Formations
X=uint8(img);
level = graythresh(X);
Binary_Image = im2bw(X,level);
%% Box Ploting for FD
figure
[n,r] = boxcount(Binary_Image,'slope');
df = -diff(log(n))./diff(log(r));
disp(['Fractal dimension, Df = ' num2str(mean(df(4:8))) ' +/- ' num2str(std(df(4:8)))]);
%% Probability P=0.8,
Countour = randcantor(0.8);
figure
boxcount(Countour)

set(handles.edit1,'String',['FD =' num2str(mean(df(4:8))) ' +/- ' num2str(std(df(4:8)))]);
%%                           END



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
