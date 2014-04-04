function varargout = SunstangUI(varargin)
% SUNSTANGUI MATLAB code for SunstangUI.fig
%      SUNSTANGUI, by itself, creates a new SUNSTANGUI or raises the existing
%      singleton*.
%
%      H = SUNSTANGUI returns the handle to a new SUNSTANGUI or the handle to
%      the existing singleton*.
%
%      SUNSTANGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SUNSTANGUI.M with the given input arguments.
%
%      SUNSTANGUI('Property','Value',...) creates a new SUNSTANGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before SunstangUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to SunstangUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help SunstangUI

% Last Modified by GUIDE v2.5 01-Apr-2014 15:19:21

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SunstangUI_OpeningFcn, ...
                   'gui_OutputFcn',  @SunstangUI_OutputFcn, ...
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


% --- Executes just before SunstangUI is made visible.
function SunstangUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SunstangUI (see VARARGIN)

%%assign the battery-current plot to the one being displayed
%axes(handles.battery_current);
y_array = [];

%y_array = zeros(1,100000);

%%generate random y values
for i = 1:100
    r1 = times(rand,5);
    y_array(end + 1) = r1;
    drawnow;
end
x = 4;
updateBatteryVoltage(y_array, hObject, handles);

% Choose default command line output for SunstangUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes SunstangUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = SunstangUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;




function [] = updateBatteryVoltage(an_array, hObject,handles) 
    axes(handles.battery_current);
    plot(an_array, '-.dk','linewidth',1.5); 

% Choose default command line output for SunstangUI
    handles.output = hObject;

% Update handles structure
    guidata(hObject, handles);

