6%% ==================清空环境=========================
clear;
clc;
close all;
%% =================电磁波参数========================
alpha = -0.08;          	%衰减常数
beta = 2*pi;            	%相位常数
w = 6*pi*1e8;
yeta = 1.20*pi;				%波阻抗
kecei = 0.25*pi;
EE = 20*sqrt(2);
HH = EE/yeta;
phi = 0;						%电场初始相位
%% ==================仿真参数========================
grid on;
x=[0:0.01:10];				%沿x轴传播
zero=zeros(size(x));
%% ==============导电媒质中连续时刻电磁波传播动态图======
aviobj = VideoWriter('electavi.avi');
aviobj.FrameRate = 3;
open(aviobj);
for t = 0:100            				%时间以纳米为单位
    Ez=EE*exp(alpha*x).*cos(w*t*1e-9-beta*x-phi);
    Hy=HH*exp(alpha*x).*cos(w*t*1e-9-beta*x-kecei);
    quiver3(x,zero,zero,zero,zero,Ez,1,'R','ShowArrowHead','off');
    hold on;
    quiver3(x,zero,zero,zero,Hy,zero,1,'B','ShowArrowHead','off');
    hold off;
    xlabel('电磁场传播方向','fontSize',12);
    ylabel('磁场方向','fontSize',12);
    zlabel('电场方向','fontSize',12);
    title(['导电介质中电磁波传播动态示意图','t=',num2str(t),'ns'],'fontsize',14);
    axis([0,6,-0.5,0.5,-0.5,0.5]);
    set(gca,'fontsize',10);
    CurrFrame = getframe;            	% 获取每帧图片
    writeVideo(aviobj, CurrFrame);   	% 写入AVI文件中
end
close(aviobj);
