% Adi Pamungkas, S.Si, M.Si
% Website: https://pemrogramanmatlab.com/
% Email  : adipamungkas@st.fisika.undip.ac.id

function varargout = mesingui(varargin)
% MESINGUI MATLAB code for mesingui.fig
%      MESINGUI, by itself, creates a new MESINGUI or raises the existing
%      singleton*.
%
%      H = MESINGUI returns the handle to a new MESINGUI or the handle to
%      the existing singleton*.
%
%      MESINGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MESINGUI.M with the given input arguments.
%
%      MESINGUI('Property','Value',...) creates a new MESINGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before mesingui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to mesingui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help mesingui

% Last Modified by GUIDE v2.5 04-Oct-2013 22:13:32

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @mesingui_OpeningFcn, ...
    'gui_OutputFcn',  @mesingui_OutputFcn, ...
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


% --- Executes just before mesingui is made visible.
function mesingui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to mesingui (see VARARGIN)

% Choose default command line output for mesingui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
movegui(hObject, 'center');

% UIWAIT makes mesingui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = mesingui_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
slider_suhu = get(hObject,'Value');
set(handles.edit2, 'string', strcat(num2str(slider_suhu),' *C'));

if slider_suhu <= 10
    suhu = 'dingin';
elseif slider_suhu > 10 && slider_suhu <= 20
    suhu = 'sejuk';
elseif slider_suhu > 20 && slider_suhu <= 27
    suhu = 'normal';
elseif slider_suhu > 27 && slider_suhu <= 35
    suhu = 'hangat';
else
    suhu = 'panas';
end

set(handles.text14, 'string', suhu);


slider_cahaya = get(handles.slider3,'Value');

input = [slider_suhu slider_cahaya];
fis = readfis('mesin');
out = evalfis(input,fis);

if out <= 10
    kec_mesin = 'lambat';
elseif out > 10 && out <= 18
    kec_mesin = 'sedang';
else
    kec_mesin = 'cepat';
end

set(handles.edit4,'string',strcat(num2str(out),' m/s'));
set(handles.text16, 'string', kec_mesin);

% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider3_Callback(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
slider_cahaya = get(hObject,'Value');
set(handles.edit3, 'string', strcat(num2str(slider_cahaya),' Cd'));

if slider_cahaya <= 30
    cahaya = 'gelap';
elseif slider_cahaya > 30 && slider_cahaya <= 80
    cahaya = 'normal';
else
    cahaya = 'terang';
end

set(handles.text15, 'string', cahaya);

slider_suhu = get(handles.slider2,'Value');

input = [slider_suhu slider_cahaya];
fis = readfis('mesin');
out = evalfis(input,fis);

if out <= 10
    kec_mesin = 'lambat';
elseif out > 10 && out <= 18
    kec_mesin = 'sedang';
else
    kec_mesin = 'cepat';
end

set(handles.edit4,'string',strcat(num2str(out),' m/s'));
set(handles.text16, 'string', kec_mesin);

% --- Executes during object creation, after setting all properties.
function slider3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
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



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
