function varargout = rita_gui(varargin)
% RITA_GUI MATLAB code for rita_gui.fig
%      RITA_GUI, by itself, creates a new RITA_GUI or raises the existing
%      singleton*.
%
%      H = RITA_GUI returns the handle to a new RITA_GUI or the handle to
%      the existing singleton*.
%
%      RITA_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RITA_GUI.M with the given input arguments.
%
%      RITA_GUI('Property','Value',...) creates a new RITA_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before rita_gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to rita_gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help rita_gui

% Last Modified by GUIDE v2.5 07-Oct-2015 09:25:14

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @rita_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @rita_gui_OutputFcn, ...
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


% --- Executes just before rita_gui is made visible.
function rita_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to rita_gui (see VARARGIN)

% Choose default command line output for rita_gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);


% UIWAIT makes rita_gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = rita_gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in recordbutton.
function recordbutton_Callback(hObject, eventdata, handles)
% hObject    handle to recordbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Spela in ett ljud, spela upp och plotta
hObject = audiorecorder(44100, 16, 1);

%record your voice for 5 seconds 
disp('Start speaking.')
recordblocking(hObject, 3);
disp('End of Recording.');

%play back the recording
play(hObject);

y = getaudiodata(hObject);
%Plot sker längst ned

%[y,fs] = audioread( '1000Hz.wav');
fs = 44100;

%soundsc(y, fs); %spelar upp ljudet
L = length(y); %längden av vektorn y

[maxValue,indexMax] = max(abs(fft(y-mean(y)))); %fft
freq = indexMax * fs / L;

%Rita cirklar med olika radier beroende på amplitud. 
radius= maxValue;

if freq>=500 && freq<1000
    color = '.k'; 
    
elseif freq>=1000 && freq<1500
    color = '.r'; 

elseif freq>=1500 && freq<2000
    color = '.g'; 

elseif freq>=2000 && freq<2500
    color = '.b';

else
    color = '.m'; %random färg för att se om det funkar (magenta). 
    end
    
%Hanterar två figurer samtidigt
axes(handles.axes1);
plot(y);
axes(handles.axes2);
plot(1, 1, color, 'MarkerSize', radius);


% --- Executes on button press in stopbutton.
function stopbutton_Callback(hObject, eventdata, handles)
% hObject    handle to stopbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1


% --- Executes during object creation, after setting all properties.
function axes2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1





% --- Executes on selection change in listbox2.
function listbox2_Callback(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox2
[y,fs]=audioread('1000Hz.wav');


% --- Executes during object creation, after setting all properties.
function listbox2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
