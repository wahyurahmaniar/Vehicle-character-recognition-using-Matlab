%==========================================================================
function varargout = deteksiplatmobil(varargin)
%==========================================================================

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @deteksiplatmobil_OpeningFcn, ...
                   'gui_OutputFcn',  @deteksiplatmobil_OutputFcn, ...
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

%==========================================================================
function deteksiplatmobil_OpeningFcn(hObject, eventdata, handles, varargin)
%==========================================================================
handles.output = hObject;
guidata(hObject, handles);
set(handles.figure1, 'Color', [0.702 0.851 1.0]);

%==========================================================================
function varargout = deteksiplatmobil_OutputFcn(hObject, eventdata, handles) 
%==========================================================================
varargout{1} = handles.output;

%==========================================================================
function cmdBrowse_Callback(hObject, eventdata, handles)
%==========================================================================
[PathName,FileName] = uigetfile('*.jpg','MultiSelect','ON');
image_file = strcat(FileName,PathName);
handles.image_file = image_file ;
% Update handles structure
guidata(hObject, handles);
axes(handles.plat)
imshow(image_file) % Display
set(handles.hasil,'string','')

%==========================================================================
function cmdSegmen_Callback(hObject, eventdata, handles)
%==========================================================================
global Ibox23 Ibox22 i1 i2 i3 i4 i5 i6 i7 i8

image_file=handles.image_file;
I=imread(image_file);
Ibox3=prepros(I);
%handles.plat=(Ibox3);
handles.Ibox=(Ibox3);
guidata(hObject, handles);

if isempty(Ibox23)==0
    Ibox24=imcrop(I,Ibox22);
    in=Ibox24
else in=I
end

%[CellCrop]=[i1,i2,i3,i4,i5,i6,i7,i8];
Cell=crop(Ibox3,in);
%[i1,i2,i3,i4,i5,i6,i7,i8]=crop(Ibox3,in);
axes(handles.huruf1);
imshow(i1);
axes(handles.huruf2);
imshow(i2);
axes(handles.huruf3);
imshow(i3);
axes(handles.huruf4);
imshow(i4);
axes(handles.huruf5);
imshow(i5);
axes(handles.huruf6);
imshow(i6);
axes(handles.huruf7);
imshow(i7);
axes(handles.huruf8);
imshow(i8);
guidata(hObject, handles);

%==========================================================================
function cmdSave_Callback(hObject, eventdata, handles)
%==========================================================================

%==========================================================================
function cmdRecog_Callback(hObject, eventdata, handles)
%==========================================================================
image_file=handles.image_file;
I=imread(image_file);
Ibox3=handles.Ibox;
akhir=recog(Ibox3);
set(handles.hasil,'String',akhir);
guidata(hObject, handles);
