function varargout = misson3_3(varargin)
% MISSON3_3 MATLAB code for misson3_3.fig
%      MISSON3_3, by itself, creates a new MISSON3_3 or raises the existing
%      singleton*.
%
%      H = MISSON3_3 returns the handle to a new MISSON3_3 or the handle to
%      the existingngleton*.
%
%      MISSON3_3('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MISSON3_3.M with the given input arguments.
%
%      MISSON3_3('Property','Value',...) creates a new MISSON3_3 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before misson3_3_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to misson3_3_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help misson3_3

% Last Modified by GUIDE v2.5 30-Mar-2021 11:59:39

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @misson3_3_OpeningFcn, ...
                   'gui_OutputFcn',  @misson3_3_OutputFcn, ...
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


% --- Executes just before misson3_3 is made visible.
function misson3_3_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to misson3_3 (see VARARGIN)

% Choose default command line output for misson3_3
handles.output = hObject;
set(handles.ur2,'Visible','off');
set(handles.er2,'Visible','off');   
set(handles.text13,'Visible','off'); 
set(handles.text15,'Visible','off'); 
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes misson3_3 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = misson3_3_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

%% 执行按钮回调函数
% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global p
p=0;
%% 初始化参数
u0 = 4*pi*10.^(-7);
e0 = 1/(36*pi)*10^(-9);
ur1=str2num(get(handles.ur1,'String'));
er1=str2num(get(handles.er1,'String'));
omiga=str2num(get(handles.w,'String'));
Ei0=str2num(get(handles.Ei0,'String'));
u1 = ur1*u0;
e1 = er1*e0;
if(get(handles.meizhi,'value')==2)
ur2=str2num(get(handles.ur2,'String'));
er2=str2num(get(handles.er2,'String'));
u2 = ur2*u0;
e2 = er2*e0;
k1 = omiga *sqrt(u1*e1);
eta1 = sqrt(u1/e1);
k2 = omiga *sqrt(u2*e2);
eta2 = sqrt(u2/e2);
R=(eta2-eta1)/(eta2+eta1);
T=2*eta2/(eta2+eta1);
lambda1 = 2*pi/k1;
lambda2 = 2*pi/k2;
z = -5*lambda1:lambda1/100:10*lambda2;
zero=0*ones(size(z));
%% 静态
t=0.1;
E=zeros(size(z));
H=zeros(size(z));
for i=1:length(z)
    if (z(i))<0
        E(i) = Ei0*cos(omiga*t-k1*z(i))+R*Ei0*cos(omiga*t+k1*z(i));
        H(i) =(-1)*(Ei0/eta1)*cos(omiga*t-k1*z(i))-R*(Ei0/eta1)*cos(omiga*t+k1*z(i));
    else
        E(i)=T*Ei0*cos(omiga*t-k2*z(i));
        H(i)=(-1)*(T*Ei0/eta2)*cos(omiga*t-k2*z(i));
    end
end
%% 介质一中电场特性
subplot(handles.axes1);
plot(z,E);
axis([-2*lambda1,0,-inf,inf]);
title('电场在介质一的波形 t=0.1s');
xlabel('电磁波传播方向','fontSize',12);
ylabel('电场变化方向','fontSize',12);
%% 介质二中电场特性
subplot(handles.axes2);
plot(z,E);
axis([0,10*lambda2,-inf,inf]);
title('电场在介质二的波形 t=0.1s');
xlabel('电磁波传播方向','fontSize',12);
ylabel('电场变化方向','fontSize',12);
%% 介质一中磁场特性
subplot(handles.axes3);
plot(z,H);
axis([-2*lambda1,0,-inf,inf]);
title('磁场在介质一的波形 t=0.1s');
xlabel('电磁波传播方向','fontSize',12);
ylabel('磁场变化方向','fontSize',12);
%% 介质二中磁场特性
subplot(handles.axes4);
plot(z,H);
axis([0,10*lambda2,-inf,inf]);
title('磁场在介质二的波形 t=0.1s');
xlabel('电磁波传播方向','fontSize',12);
ylabel('磁场变化方向','fontSize',12);
%% 动态
t=0;
E=zeros(size(z));
H=zeros(size(z));
subplot(handles.axes5);
grid on;
while(1)
    if(p==1)
        cla(handles.axes5); 
            break;
    end
%for t=0:0.00001:0.01
    for i=1:length(z)
        if (z(i))<0
            E(i) = Ei0*cos(omiga*t-k1*z(i))+R*Ei0*cos(omiga*t+k1*z(i));
            H(i) = (-1)*((Ei0/eta1)*cos(omiga*t-k1*z(i))-R*(Ei0/eta1)*cos(omiga*t+k1*z(i)));
        else
            E(i)=T*Ei0*cos(omiga*t-k2*z(i));
            H(i)=(-1)*(T*Ei0/eta2)*cos(omiga*t-k2*z(i));
        end
    end
    drawnow()
    h3=quiver3(z,zero,zero,zero,zero,E,'R');
    set(h3,'autoscale','off');%不缩放箭头长度
    set(h3,'maxheadsize',0);%箭头大小为0
    hold on;
    %磁场
    h4=quiver3(z,zero,zero,zero,H,zero,'B');
    set(h4,'autoscale','off');%不缩放箭头长度
    set(h4,'maxheadsize',0);%箭头大小为0
    ezmesh('0','y','z');  
    alpha(0.3);
    ti=title('电磁波垂直入射理想介质动态图','color','k');
    set(ti,'fontsize',16);
    xlabel('电磁波传播方向','fontSize',12);
    ylabel('磁场变化方向','fontSize',12);
    zlabel('电场变化方向','fontSize',12);
    legend('电场','磁场'); 
    axis([-2*lambda1,2*lambda2,-2*Ei0/eta1,2*Ei0/eta1,-2*Ei0,2*Ei0]);
    hold off;
    %getframe;
    t=t+0.00001;
end
elseif(get(handles.meizhi,'value')==1)
k1 = omiga *sqrt(u1*e1);
eta1 = sqrt(u1/e1);
lambda1 = 2*pi/k1;
z = -5*lambda1:lambda1/100:0;
zero=0*ones(size(z));
%% 静态
t=0.1;
E=zeros(size(z));
H=zeros(size(z));
for i=1:length(z)
        E(i) = 2*Ei0*sin(omiga*t)*sin(k1*z(i));
        H(i) = (-1)*2*(Ei0/eta1)*cos(omiga*t)*cos(k1*z(i));
end
%% 介质一中电场特性
subplot(handles.axes1);
plot(z,E);
axis([-2*lambda1,0,-inf,inf]);
title('电场在介质一的波形 t=0.1s');
xlabel('电磁波传播方向','fontSize',12);
ylabel('电场变化方向','fontSize',12);


%% 介质一中磁场特性
subplot(handles.axes3);
plot(z,H);
axis([-2*lambda1,0,-inf,inf]);
title('磁场在介质一的波形 t=0.1s');
xlabel('电磁波传播方向','fontSize',12);
ylabel('磁场变化方向','fontSize',12);
%% 电场  多次 驻波
for t = 0:0.00001:0.001
    E1 = 2*Ei0* sin(k1*z).*sin(omiga*t);
    subplot(handles.axes2);
    plot(z,E1);
    hold on;
    axis([ -2*lambda1,0,-inf,inf])
    title('电场在导体外侧的波形,多次')
end
%磁场 多次 驻波
hold off;
for t = 0:0.00001:0.001
    H1 = (-1)*2*Ei0/eta1* cos(k1*z).*cos(omiga*t);
    subplot(handles.axes4);
    plot(z,H1);
    hold on;
    axis([ -2*lambda1,0,-inf,inf])
    title('磁场在导体外侧的波形,多次')
end
hold off;
%% 动态
E=zeros(size(z));
H=zeros(size(z));
subplot(handles.axes5);
grid on;
while(1)
    if(p==1)
        cla(handles.axes5); 
            break;
    end
%for t=0:0.00001:0.01
     for i=1:length(z)
            E(i) =2*Ei0*sin(omiga*t)*sin(k1*z(i));
            H(i) =(-1)*2*(Ei0/eta1)*cos(omiga*t)*cos(k1*z(i));
     end
    drawnow()
    h3=quiver3(z,zero,zero,zero,zero,E,'R');
    set(h3,'autoscale','off');%不缩放箭头长度
    set(h3,'maxheadsize',0);%箭头大小为0
    hold on;
    %磁场
    h4=quiver3(z,zero,zero,zero,H,zero,'B');
    set(h4,'autoscale','off');%不缩放箭头长度
    set(h4,'maxheadsize',0);%箭头大小为0
    ti=title('电磁波垂直入射理想导体动态图','color','k');
    set(ti,'fontsize',16);
    xlabel('电磁波传播方向','fontSize',12);
    ylabel('磁场变化方向','fontSize',12);
    zlabel('电场变化方向','fontSize',12);
    legend('电场','磁场'); 
    axis([-2*lambda1,0,-2*Ei0/eta1,2*Ei0/eta1,-2*Ei0,2*Ei0]);
    hold off;
    t=t+0.00001;
    %getframe;
end
end
guidata(hObject, handles);

function Ei0_Callback(hObject, eventdata, handles)
% hObject    handle to Ei0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Ei0 as text
%        str2double(get(hObject,'String')) returns contents of Ei0 as a double


% --- Executes during object creation, after setting all properties.
function Ei0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Ei0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function w_Callback(hObject, eventdata, handles)
% hObject    handle to w (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of w as text
%        str2double(get(hObject,'String')) returns contents of w as a double


% --- Executes during object creation, after setting all properties.
function w_CreateFcn(hObject, eventdata, handles)
% hObject    handle to w (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ur1_Callback(hObject, eventdata, handles)
% hObject    handle to ur1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ur1 as text
%        str2double(get(hObject,'String')) returns contents of ur1 as a double


% --- Executes during object creation, after setting all properties.
function ur1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ur1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function er1_Callback(hObject, eventdata, handles)
% hObject    handle to er1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of er1 as text
%        str2double(get(hObject,'String')) returns contents of er1 as a double


% --- Executes during object creation, after setting all properties.
function er1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to er1 (see GCBO)
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



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to Ei0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Ei0 as text
%        str2double(get(hObject,'String')) returns contents of Ei0 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Ei0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to ur1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ur1 as text
%        str2double(get(hObject,'String')) returns contents of ur1 as a double


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ur1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit10_Callback(hObject, eventdata, handles)
% hObject    handle to er1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of er1 as text
%        str2double(get(hObject,'String')) returns contents of er1 as a double


% --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to er1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ur2_Callback(hObject, eventdata, handles)
% hObject    handle to ur2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ur2 as text
%        str2double(get(hObject,'String')) returns contents of ur2 as a double


% --- Executes during object creation, after setting all properties.
function ur2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ur2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function er2_Callback(hObject, eventdata, handles)
% hObject    handle to er2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of er2 as text
%        str2double(get(hObject,'String')) returns contents of er2 as a double


% --- Executes during object creation, after setting all properties.
function er2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to er2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in meizhi.
function meizhi_Callback(hObject, eventdata, handles)
% hObject    handle to meizhi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns meizhi contents as cell array
%        contents{get(hObject,'Value')} returns selected item from meizhi
if(get(handles.meizhi,'value')==1)
    set(handles.ur2,'Visible','off');
    set(handles.er2,'Visible','off'); 
    set(handles.text13,'Visible','off'); 
    set(handles.text15,'Visible','off');      
elseif(get(handles.meizhi,'value')==2)
    set(handles.er2,'Visible','on');   
    set(handles.ur2,'Visible','on');
    set(handles.text13,'Visible','on');   
    set(handles.text15,'Visible','on');   
end
guidata(hObject, handles);
% --- Executes during object creation, after setting all properties.
function meizhi_CreateFcn(hObject, eventdata, handles)
% hObject    handle to meizhi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in tingzhi.
function tingzhi_Callback(hObject, eventdata, handles)
% hObject    handle to tingzhi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global p
p=1;
guidata(hObject, handles);


% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global p
p=1;
% Hint: delete(hObject) closes the figure
delete(hObject);
