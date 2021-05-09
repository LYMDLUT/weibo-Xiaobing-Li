%% =====================清空环境===========================
clear;
clc;
close all;
%% ===================设置电磁场参数========================
u0 = 4*pi*1e-7;         	%真空磁导率
e0 = 1/(36*pi)*1e-9;    		%自由空间介电常数
z0= sqrt(u0/e0);        		%波阻抗
k = 2*pi;               	%波数
w = 6*pi*1e8;
phi = 0;                	%初始相位
EE = 20*sqrt(2);       	 	%电场振幅
HH = EE/z0;             	%磁场振幅
%% ====================设置仿真参数========================
grid on;
z = [0:0.01:6];         		%沿z轴传播
zero=0*ones(size(z));
%% =============描绘理想介质中电磁波传播动图=================
aviobj = VideoWriter('idealavi.avi');
aviobj.FrameRate = 3;
open(aviobj);
for t = 0:50            				%时间以纳米为单位
    Ex = EE*exp(0*z).*cos(w*t*1e-9-k*z+phi);
    Hy = HH*exp(0*z).*cos(w*t*1e-9-k*z+phi);
    quiver3(z,zero,zero,zero,Ex,zero,1,'R','ShowArrowHead','off');
    hold on;
    quiver3(z,zero,zero,zero,zero,Hy,1,'B','ShowArrowHead','off');
    hold off;
    xlabel('电磁场传播方向','fontSize',12);
    ylabel('电场方向','fontSize',12);
    zlabel('磁场方向','fontSize',12);
    title(['理想介质平面电磁波传播动态示意图','t=',num2str(t),'ns'],'fontsize',14);
    axis([0,6,-0.5,0.5,-0.5,0.5]);
    set(gca,'fontsize',10);
    CurrFrame = getframe;            % 获取每帧图片
    writeVideo(aviobj, CurrFrame);   	% 写入AVI文件中
end
close(aviobj);
