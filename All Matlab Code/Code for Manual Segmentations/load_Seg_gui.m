function varargout = load_Seg_gui(varargin)
% LOAD_SEG_GUI MATLAB code for load_Seg_gui.fig
%      LOAD_SEG_GUI, by itself, creates a new LOAD_SEG_GUI or raises the existing
%      singleton*.
%
%      H = LOAD_SEG_GUI returns the handle to a new LOAD_SEG_GUI or the handle to
%      the existing singleton*.
%
%      LOAD_SEG_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LOAD_SEG_GUI.M with the given input arguments.
%
%      LOAD_SEG_GUI('Property','Value',...) creates a new LOAD_SEG_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before load_Seg_gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to load_Seg_gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help load_Seg_gui

% Last Modified by GUIDE v2.5 18-Jan-2018 18:23:50

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @load_Seg_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @load_Seg_gui_OutputFcn, ...
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


% --- Executes just before load_Seg_gui is made visible.
function load_Seg_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to load_Seg_gui (see VARARGIN)

% Choose default command line output for load_Seg_gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes load_Seg_gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = load_Seg_gui_OutputFcn(hObject, eventdata, handles) 
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
load('manual_seg.mat');



% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
load('Pints_yxzt.mat');


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
load('manual_seg.mat');
load('Pints_yxzt.mat');
axes(handles.axes1);
show_segs(manual_seg_32points, sol_yxzt, 500, 5, 20);


% --- Executes during object creation, after setting all properties.
function axes5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
I=imread('logo-condorcet.jpg');
imshow(I);
% Hint: place code in OpeningFcn to populate axes5


% --- Executes during object creation, after setting all properties.
function axes6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
I=imread('MAIA_LOGO.jpg');
imshow(I);
% Hint: place code in OpeningFcn to populate axes6
