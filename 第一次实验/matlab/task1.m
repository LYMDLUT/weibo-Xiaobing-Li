function varargout = task1(varargin)
% TASK1 MATLAB code for task1.fig
%      TASK1, by itself, creates a new TASK1 or raises the existing
%      singleton*.
%
%      H = TASK1 returns the handle to a new TASK1 or the handle to
%      the existing singleton*.
%
%      TASK1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TASK1.M with the given input arguments.
%
%      TASK1('Property','Value',...) creates a new TASK1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before task1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to task1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help task1

% Last Modified by GUIDE v2.5 18-Mar-2021 10:25:41

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @task1_OpeningFcn, ...
                   'gui_OutputFcn',  @task1_OutputFcn, ...
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


% --- Executes just before task1 is made visible.
function task1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to task1 (see VARARGIN)

% Choose default command line output for task1
handles.output = hObject;
set(handles.lixiang,'value',1);
set(handles.daodian,'value',0);
set(handles.diandao,'Visible','off');
set(handles.faicha,'Visible','off');
set(handles.shuaijian,'Visible','off');
set(handles.text7,'Visible','off');
set(handles.text8,'Visible','off');
set(handles.text9,'Visible','off');
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes task1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = task1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in queding.
function queding_Callback(hObject, eventdata, handles)
% hObject    handle to queding (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global p
p=0;
gifname='mag_motion.gif';
gifname1='mag_motion1.gif';
if(get(handles.luzhi,'value')==1)
    v1 = VideoWriter([handles.PathName,handles.FileName]);
    open(v1);
end
if(isempty(get(handles.amp,'string'))==1||isempty(str2num(get(handles.fai,'string')))==1||isempty(str2num(get(handles.omg,'string')))==1 ...
   ||isempty(str2num(get(handles.jiedian,'string')))==1||isempty(str2num(get(handles.cidao,'string')))==1)
    mode=struct('WindowStyle','modal','Interpreter','tex');%modal即为模态
    errordlg('请输入正确数值1','Warning',mode);
else if(str2num(get(handles.amp,'string'))<=0||str2num(get(handles.omg,'string'))<=0 ...
       ||str2num(get(handles.jiedian,'string'))<=0||str2num(get(handles.cidao,'string'))<=0)
        mode=struct('WindowStyle','modal','Interpreter','tex');%modal即为模态
        errordlg('请输入正确数值2','Warning',mode);%前者是内容，后者是名称
else
    amp=str2num(get(handles.amp,'string'));
    fai=str2num(get(handles.fai,'string'));
    omg=str2num(get(handles.omg,'string'));
    jiedian=str2num(get(handles.jiedian,'string'))*(1/(36*pi))*10^(-9);
    cidao=str2num(get(handles.cidao,'string'))*4*pi*10^(-7);
    T=2*pi/omg;
    x=0:0.01:30;
    t=0;
    zero=0*ones(size(x));
    if(get(handles.lixiang,'value')==1)
        k=omg*sqrt(jiedian*cidao);
        benzheng=sqrt(cidao/jiedian);
        while(p==0)
        drawnow()
frame=getframe();%获取当前图像

im=frame2im(frame);

[imind,cm]=rgb2ind(im,500);%格式转换

if t==0

imwrite(imind,cm,gifname,'gif');%创建一个gif文件

else

imwrite(imind,cm,gifname,'gif','WriteMode','append','DelayTime',0.1);

%向gif文件中添加一张图片

end

        E=amp*cos(omg*t-k*x+fai);
        H=(amp/benzheng)*cos(omg*t-k*x+fai);
        if(ishandle(handles.figure1)==1)
        axes(handles.axes1)
        h1=quiver3(x,zero,zero,zero,zero,E,'r');
        set(h1,'maxheadsize',0);%箭头大小为0
                hold on;
                %磁场
                h2=quiver3(x,zero,zero,zero,H,zero,'b');
                set(h2,'maxheadsize',0);%箭头大小为0
                legend('电场','磁场');
                ti=title(' 电磁波在理想介质中传播','color','k');
                set(ti,'fontsize',16);
                xlabel(' 电磁波传播方向','fontSize',12);
                ylabel(' 磁场变化方向','fontSize',12);
                zlabel(' 电场变化方向','fontSize',12);
                hold off;
                t=t+T/50;
                if(get(handles.luzhi,'value')==1)
               writeVideo(v1,getframe(gcf));
                end
            else
                    break;
                end
        end
      else if(get(handles.daodian,'value')==1)
        if (isempty(str2num(get(handles.faicha,'string')))==1||isempty(str2num(get(handles.diandao,'string')))==1)
        mode=struct('WindowStyle','modal','Interpreter','tex');%modal即为模态
        errordlg('请输入正确数值3','警告',mode);%前者是内容，后者是名称
        else if(str2num(get(handles.diandao,'string'))<=0)
        mode=struct('WindowStyle','modal','Interpreter','tex');%modal即为模态
        errordlg('请输入正确数值4','警告',mode);%前者是内容，后者是名称
        else
        diandao=str2num(get(handles.diandao,'string'));
        faicha=str2num(get(handles.faicha,'string'));
        benzheng=sqrt(cidao/sqrt(jiedian^2+(diandao/omg)^2));
            aif=omg*sqrt(jiedian*cidao/2)*sqrt(sqrt(1+(diandao/(omg*jiedian))^2)-1)
           set(handles.shuaijian,'string',num2str(aif));
            beta=omg*sqrt(jiedian*cidao/2)*sqrt(sqrt(1+(diandao/(omg*jiedian))^2)+1);
            if(aif>=1)
                mode=struct('WindowStyle','modal','Interpreter','tex');%modal即为模态
                errordlg('参数有误','警告',mode);%前者是内容，后者是名称
            else    
          while(p==0)
                    drawnow()
frame=getframe();%获取当前图像

im=frame2im(frame);

[imind,cm]=rgb2ind(im,500);%格式转换

if t==0

imwrite(imind,cm,gifname1,'gif');%创建一个gif文件

else

imwrite(imind,cm,gifname1,'gif','WriteMode','append','DelayTime',0.1);

%向gif文件中添加一张图片

end
                    E=amp*exp(-aif*x).*cos(omg*t-beta*x+fai);
                    H=(amp/benzheng)*exp(-aif*x).*cos(omg*t-beta*x-faicha+fai);
                    if(ishandle(handles.figure1)==1)
                    axes(handles.axes1)
                    %电场
                    h3=quiver3(x,zero,zero,zero,zero,E,'R');
                    set(h3,'maxheadsize',0);%箭头大小为0
                    hold on;
                    %磁场
                    h4=quiver3(x,zero,zero,zero,H,zero,'B');
                    set(h4,'maxheadsize',0);%箭头大小为0
                    legend('电场','磁场');
                    ti=title(' 电磁波在导电媒质中传播','color','k');
                    set(ti,'fontsize',16);
                    xlabel(' 电磁波传播方向','fontSize',12);
                    ylabel(' 磁场变化方向','fontSize',12);
                    zlabel(' 电场变化方向','fontSize',12);
                    hold off;
                    t=t+T/50;

                if(get(handles.luzhi,'value')==1)
                writeVideo(v1,getframe(gcf));
                end
                    else
                        break;
                    end
          end
                 end
            end
        end
       else if (get(handles.lixiang,'value')==0&&get(handles.daodian,'value')==0)
           mode=struct('WindowStyle','modal','Interpreter','tex');%modal即为模态
           errordlg('请选择一种媒质','警告',mode);%前者是内容，后者是名称
           end
    end
  end
 end
end   
if(get(handles.luzhi,'value')==1)
   close(v1);
end
% --- Executes on button press in stop.
function stop_Callback(hObject, eventdata, handles)
% hObject    handle to stop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global p
p=1;
guidata(hObject,handles);
% --- Executes on button press in lixiang.
function lixiang_Callback(hObject, eventdata, handles)
% hObject    handle to lixiang (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.lixiang,'value',1);
set(handles.daodian,'value',0);
set(handles.diandao,'Visible','off');
set(handles.faicha,'Visible','off');
set(handles.shuaijian,'Visible','off');
set(handles.text7,'Visible','off');
set(handles.text8,'Visible','off');
set(handles.text9,'Visible','off');
guidata(hObject,handles);
% Hint: get(hObject,'Value') returns toggle state of lixiang


% --- Executes on button press in daodian.
function daodian_Callback(hObject, eventdata, handles)
% hObject    handle to daodian (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.lixiang,'value',0);
set(handles.daodian,'value',1);
set(handles.diandao,'Visible','on');
set(handles.faicha,'Visible','on');
set(handles.shuaijian,'Visible','on');
set(handles.text7,'Visible','on');
set(handles.text8,'Visible','on');
set(handles.text9,'Visible','on');
guidata(hObject,handles);
% Hint: get(hObject,'Value') returns toggle state of daodian



function amp_Callback(hObject, eventdata, handles)
% hObject    handle to amp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of amp as text
%        str2double(get(hObject,'String')) returns contents of amp as a double


% --- Executes during object creation, after setting all properties.
function amp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to amp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function omg_Callback(hObject, eventdata, handles)
% hObject    handle to omg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of omg as text
%        str2double(get(hObject,'String')) returns contents of omg as a double


% --- Executes during object creation, after setting all properties.
function omg_CreateFcn(hObject, eventdata, handles)
% hObject    handle to omg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function fai_Callback(hObject, eventdata, handles)
% hObject    handle to fai (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of fai as text
%        str2double(get(hObject,'String')) returns contents of fai as a double


% --- Executes during object creation, after setting all properties.
function fai_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fai (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function jiedian_Callback(hObject, eventdata, handles)
% hObject    handle to jiedian (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of jiedian as text
%        str2double(get(hObject,'String')) returns contents of jiedian as a double


% --- Executes during object creation, after setting all properties.
function jiedian_CreateFcn(hObject, eventdata, handles)
% hObject    handle to jiedian (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function faicha_Callback(hObject, eventdata, handles)
% hObject    handle to faicha (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of faicha as text
%        str2double(get(hObject,'String')) returns contents of faicha as a double


% --- Executes during object creation, after setting all properties.
function faicha_CreateFcn(hObject, eventdata, handles)
% hObject    handle to faicha (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function cidao_Callback(hObject, eventdata, handles)
% hObject    handle to cidao (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of cidao as text
%        str2double(get(hObject,'String')) returns contents of cidao as a double


% --- Executes during object creation, after setting all properties.
function cidao_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cidao (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function diandao_Callback(hObject, eventdata, handles)
% hObject    handle to diandao (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of diandao as text
%        str2double(get(hObject,'String')) returns contents of diandao as a double


% --- Executes during object creation, after setting all properties.
function diandao_CreateFcn(hObject, eventdata, handles)
% hObject    handle to diandao (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%% 退出函数
button=questdlg('你确定退出吗？','退出程序','Yes','No','Yes');%内容，标题，选项，默认选项

if strcmp(button,'Yes')
   % if(get(handles.luzhi,'value')==1)
 %   close(v1);
  %  end
      delete(hObject);
    
end

% Hint: delete(hObject) closes the figure


% --- Executes on button press in luzhi.
function luzhi_Callback(hObject, eventdata, handles)
% hObject    handle to luzhi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of luzhi
if(get(handles.luzhi,'value')==1)

[handles.FileName,handles.PathName] =uiputfile('*.avi','文件位置');
end
guidata(hObject,handles);



function shuaijian_Callback(hObject, eventdata, handles)
% hObject    handle to shuaijian (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of shuaijian as text
%        str2double(get(hObject,'String')) returns contents of shuaijian as a double


% --- Executes during object creation, after setting all properties.
function shuaijian_CreateFcn(hObject, eventdata, handles)
% hObject    handle to shuaijian (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
