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

% Last Modified by GUIDE v2.5 11-Oct-2015 10:33:35

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

L = length(y); %längden av vektorn y

[maxValue,indexMax] = max(abs(fft(y-mean(y)))); %fft
freq = 2*indexMax * fs / L;

%Rita cirklar med olika radier beroende på amplitud. 
radius = maxValue/10;
  
%BILDEN: axes3
myimage1 = imread('Fosseboll.jpg');

HSV= rgb2hsv(myimage1);
% changes saturation:
if freq>=600 && freq<900
    HSV(:, :, 2) = HSV(:, :, 2) * 0.4;
    mess = 'Mycket högre frekvens tack';
elseif freq>=900 && freq<1200
    HSV(:, :, 2) = HSV(:, :, 2) * 0.6;  
    mess = 'Lagom mer frekvens tack';
elseif freq>=1200 && freq<1500
    HSV(:, :, 2) = HSV(:, :, 2) * 0.8;
    mess = 'Lite högre frekvens tack';
elseif freq>=1500 && freq<1800
   HSV(:, :, 2) = HSV(:, :, 2) * 1;
   mess = 'Perfekt frekvens!';
elseif freq>=1800 && freq<2100
    HSV(:, :, 2) = HSV(:, :, 2) * 1.2;
    mess = 'Lite lägre frekvens tack';
elseif freq>=2100 && freq<2500
    HSV(:, :, 2) = HSV(:, :, 2) * 1.4;
    mess = 'Lagom lägre frekvens tack';
elseif freq>=1800 && freq<2100
    HSV(:, :, 2) = HSV(:, :, 2) * 1.2;
    mess = 'Mycket lägre frekvens tack';
else
    HSV(:, :, 2) = HSV(:, :, 2) * 5; 
    mess = 'Helt fel, försök igen';
end

%changes lightness
if maxValue<=100
    Value = 0; %svart bild
    mess2 = 'Tyst som en mus';
elseif maxValue>=100 && maxValue<800
    Value = 0.2; 
    mess2 = 'Sa du något?';
elseif maxValue>=800 && maxValue<1000
    Value = 0.4 
    mess2 = 'Höj volymen mycket!';
elseif maxValue>=1000 && maxValue<1200
   Value = 0.6; 
   mess2 = 'Högre Volym vore bra';
elseif maxValue>=1200 && maxValue<1400
   Value = 0.8; 
   mess2 = 'Höj volymen en aning';
elseif maxValue>=1400 && maxValue<1600
   Value = 1; 
   mess2 = 'Perfekt volym!';
elseif maxValue>=1600 && maxValue<1800
    Value = 1.2; 
    mess2 = 'Sänk volymen en aning';
elseif maxValue>=2000 && maxValue<2200
    Value = 1.4 
    mess2 = 'Sänk volymen';
elseif maxValue>=2200 && maxValue<2400
   Value = 1.6; 
   mess2 = 'Alldeles för hög volym, tänk på grannarna';
elseif maxValue>=2400 && maxValue<3000
   Value = 1.8; 
   mess2 = 'Sluta SKRIK!';
else
   Value = 2; %vit bild
   mess2 = 'Jag fick precis tinitus :(';
end
   
HSV(HSV > 1) = 1;  % Limit values
RGB2 = hsv2rgb(HSV)*Value;
% Slut på kod till axes3!

%Hanterar två figurer samtidigt
axes(handles.axes3);
imshow(RGB2);
axes(handles.axes4);
imshow(myimage1);

%Skriver ut frekvensen
set(handles.edit1,'string',mess); 
%Skriver ut amplituden
set(handles.edit2,'string',mess2);


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

% --- Executes during object creation, after setting all properties.
function axes3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1

% --- Executes during object creation, after setting all properties.
function axes4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1

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



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
