function varargout = bodao(varargin)
% BODAO MATLAB code for bodao.fig
%      BODAO, by itself, creates a new BODAO or raises the existing
%      singleton*.
%
%      H = BODAO returns the handle to a new BODAO or the handle to
%      the existing singleton*.
%
%      BODAO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BODAO.M with the given input arguments.
%
%      BODAO('Property','Value',...) creates a new BODAO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before bodao_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to bodao_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help bodao

% Last Modified by GUIDE v2.5 13-Jun-2020 10:51:45

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @bodao_OpeningFcn, ...
                   'gui_OutputFcn',  @bodao_OutputFcn, ...
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


% --- Executes just before bodao is made visible.
function bodao_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to bodao (see VARARGIN)

% Choose default command line output for bodao
handles.output = hObject;
set(handles.pingmian,'visible','off');
set(handles.static,'value',1);
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes bodao wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = bodao_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in pick.
function pick_Callback(hObject, eventdata, handles)
% hObject    handle to pick (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.choice1= get(handles.pick,'value')
if handles.choice1==1
    set(handles.static,'visible','on');
    set(handles.dyna,'visible','on');
    set(handles.pingmian,'visible','off');
elseif handles.choice1==4
    set(handles.pingmian,'visible','off');
    set(handles.static,'visible','off');
    set(handles.dyna,'visible','off');
else
    set(handles.static,'visible','off');
    set(handles.dyna,'visible','off');
    set(handles.pingmian,'visible','on');
end
guidata(hObject,handles);

% Hints: contents = cellstr(get(hObject,'String')) returns pick contents as cell array
%        contents{get(hObject,'Value')} returns selected item from pick


% --- Executes during object creation, after setting all properties.
function pick_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pick (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in pingmian.
function pingmian_Callback(hObject, eventdata, handles)
% hObject    handle to pingmian (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns pingmian contents as cell array
%        contents{get(hObject,'Value')} returns selected item from pingmian


% --- Executes during object creation, after setting all properties.
function pingmian_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pingmian (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in disp.
function disp_Callback(hObject, eventdata, handles)
% hObject    handle to disp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% ===============电磁场参数==========================
u0 = 4*pi*10.^(-7);
e0 = 1/(36*pi)*10^(-9);
u = u0;
e = e0;
f  = str2num(get(handles.pinlv,'string'))*10^9;
w = 2*pi*f;
a = str2num(get(handles.amm,'string'))/1000;
b = str2num(get(handles.bmm,'string'))/1000;
H10 = str2num(get(handles.h10,'string'));
c = 299792458 ;
beta = w/c;
k = w *sqrt(u*e);
lambda = 2*pi*c/w
d  = 15;
lc=2*a;             %TE10截止波长
l0=(3*10^8)/f;
handles.choice1= get(handles.pick,'value');
handles.choice2= get(handles.pingmian,'value');
%======================选择显示电磁场、切片、三维Ey===================
switch handles.choice1
%----------显示波导内电磁场------------
    case 1                              
        grid on
        lg=l0/((1-(l0/lc)^2)^0.5);
        c=lg;
        B=2*pi/lg;
        x=0:a/d:a;y=0:b/d:b;z=0:c/d:c;
        [x1,y1,z1]=meshgrid(x,y,z);
        if get(handles.static,'value')  %显示静态电磁场
            t=0;
            ex=zeros(size(x1));
            ey=w.*u.*a.*H10.*sin(pi./a.*x1).*sin(w*t-B.*z1)./pi;
            ez=zeros(size(z1));
            quiver3(z1,x1,y1,ez,ex,ey,'r');
            hold on;
            hx=(-1)*B.*a.*H10.*sin(pi./a.*x1).*sin(w*t-B.*z1)./pi;
            hy=zeros(size(y1));
            hz=H10.*cos(pi./a.*x1).*cos(w*t-B.*z1);
            quiver3(z1,x1,y1,hz,hx,hy,'b');
            title('波导管内电磁场分布图');
            axis equal
            xlabel('传输方向');ylabel('波导宽边a');zlabel('波导窄边b');
            hold off;
        elseif get(handles.dyna,'value')    %显示动态电磁场
            v=VideoWriter('bodao.avi');
            v.FrameRate = 10;
            open(v);
            for t=0:10^(-9):5*10^(-8)
                ex=zeros(size(x1));
                ey=w.*u.*a.*H10.*sin(pi./a.*x1).*sin(w*t-B.*z1)./pi;
                ez=zeros(size(z1));
                h=quiver3(z1,x1,y1,ez,ex,ey,'r');
                set(h,'maxheadsize',0);
                hold on;
                hx=(-1)*B.*a.*H10.*sin(pi./a.*x1).*sin(w*t-B.*z1)./pi;
                hy=zeros(size(y1));
                hz=H10.*cos(pi./a.*x1).*cos(w*t-B.*z1);
                h=quiver3(z1,x1,y1,hz,hx,hy,'b');
                set(h,'maxheadsize',0);
                title(['波导管内电磁场分布图','t=',num2str(t),'s']);
                axis equal
                xlabel('传输方向');ylabel('波导宽边a');zlabel('波导窄边b');
                pause(10^(-8));
                CurrFrame = getframe();            % 获取每帧图片
                CurrFrame.cdata=imresize(CurrFrame.cdata,[768 1024]);
                writeVideo(v,CurrFrame);
                hold off;
            end
             close(v);
        end
%------------------选择单次切片显示-----------
     case 2
         cla(handles.huatu);
         switch handles.choice2
             case 1
                 x = a/2;
                 t = 0.0001;
                 z = 0 : lambda/d : lambda;
                 hx = beta * a / pi * H10 * sin(pi * x / a) .* cos(w * t - beta * z + pi / 2);
                 plot(z,hx,'b-');
                 title('t = 0.0001时，宽边x = 11mm纵切，波导内Hx波形');
                 xlabel('传输方向z');
                 hold off;
               case 2
                   x = a/2;
                   t = 0.0001;
                   z = 0 : lambda/d : lambda; 
                   ey = w * u * a / pi * H10 * sin(pi * x / a) .* cos(w * t - beta * z - pi / 2);
                   plot(z,ey,'r-');
                   title('t=0.0001s时,宽边x=11mm纵切，波导内Ey波形');
                   xlabel('传输方向z');
                   hold off;
               case 3
                   z = 3;
                   t = 0.0001;
                   x = 0 : lambda/d : lambda;
                   hz = H10 * cos(pi * x / a) .* cos(w * t - beta * z);
                   plot(x,hz,'y-');
                   title('t=0.0001s,传播方向z=3横断面处，波导内Hz强度波形');
                   xlabel('宽边x方向');
                   hold off;   
         end
%------------多次切片显示---------------           
     case 3
         cla(handles.huatu);
         x = -a : lambda / 10 : 0;
        switch handles.choice2
            case 1
                for z =0 : 0.001 : 0.1/4
                    %电场  多次 驻波
                    for t = 0 : 0.0001 : 0.0001
                        Hx = beta*a/pi*H10*sin(pi*x/a).*cos(w*t-beta*z+pi/2);
                        plot(x , Hx);
                        axis([ -a, 0 , -inf , inf]);
                        title('波导内Hx强度波形');
                        xlabel('宽边x方向');
                        pause(0.05)
                        hold on
                     end
                    pause(0.05)
                end
                hold off
           case  2
                cla(handles.huatu);
                for z =0 : 0.001 : 0.1/2
                    %电场  多次 驻波
                    for t = 0 : 0.0001 : 0.0001
                       Ey = w*u*a/pi*H10*sin(pi*x/a).*cos(w*t-beta*z-pi/2);
                        plot(x , Ey);
                        axis([ -a , 0 , -inf , inf])
                        title('波导内Ey强度波形');
                          xlabel('宽边x方向');
                        pause(0.05)
                        hold on
                    end
                     pause(0.05)
                end
                hold off
            case 3
                cla(handles.huatu);
                for z =0 : 0.001 : 0.1/2
                    %电场  多次 驻波
                    for t = 0 : 0.0001 : 0.0001
                    Hz = H10*cos(pi*x/a).*cos(w*t-beta*z);
                    plot(x , Hz);
                    axis([ -a , 0 , -inf , inf]);
                    title('波导内Hz强度波形');
                    xlabel('宽边x方向');
                    pause(0.05)
                    hold on
                    end
                pause(0.05)
                end
                hold off
        end
%------------t=1时，任意x平面的Ey----------------        
     case  4
       cla(handles.huatu);
       lg = lambda / ((1 - (lambda / lc)^2)^0.5);
       B = 2 * pi / lg;
       w = 2 * pi * f;
       t = 1;
       x = 0 : a/d : a;
       z= 0 : lg/d : lg;
       [x2,z2] = meshgrid(x,z);
       Ey = w*u*a*H10*sin(pi/a*x2).*sin(w*t-B*z2)/pi;
       surf(handles.huatu,x2,z2,Ey);
       title('任意x处,Ey电场大小');
       ylabel('传输方向z');xlabel('波导宽边a');zlabel('波导窄边b');
end
guidata(hObject,handles);



% --- Executes on button press in static.
function static_Callback(hObject, eventdata, handles)
% hObject    handle to static (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.static,'value',1);
set(handles.dyna,'value',0);
guidata(hObject,handles);
% Hint: get(hObject,'Value') returns toggle state of static


% --- Executes on button press in dyna.
function dyna_Callback(hObject, eventdata, handles)
% hObject    handle to dyna (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.static,'value',0);
set(handles.dyna,'value',1);
guidata(hObject,handles);
% Hint: get(hObject,'Value') returns toggle state of dyna



function pinlv_Callback(hObject, eventdata, handles)
% hObject    handle to pinlv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pinlv as text
%        str2double(get(hObject,'String')) returns contents of pinlv as a double


% --- Executes during object creation, after setting all properties.
function pinlv_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pinlv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function amm_Callback(hObject, eventdata, handles)
% hObject    handle to amm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of amm as text
%        str2double(get(hObject,'String')) returns contents of amm as a double


% --- Executes during object creation, after setting all properties.
function amm_CreateFcn(hObject, eventdata, handles)
% hObject    handle to amm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function bmm_Callback(hObject, eventdata, handles)
% hObject    handle to bmm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of bmm as text
%        str2double(get(hObject,'String')) returns contents of bmm as a double


% --- Executes during object creation, after setting all properties.
function bmm_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bmm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function h10_Callback(hObject, eventdata, handles)
% hObject    handle to h10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of h10 as text
%        str2double(get(hObject,'String')) returns contents of h10 as a double


% --- Executes during object creation, after setting all properties.
function h10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to h10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
