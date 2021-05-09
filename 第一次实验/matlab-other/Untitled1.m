%% =====================清空环境=======================
clear;
clc;
close all;
%% ==================设置电磁场参数====================
u0 = 4*pi*1e-7;         	%真空磁导率
e0 = 1/(36*pi)*1e-9;    		% 自由空间介电常数
z0= sqrt(u0/e0);
k = 2*pi;               	%波阻抗
w = 6*pi*1e8;           	%电磁波频率
phi = 0;               	%初始相位
EE = 20*sqrt(2);        	%电场振幅
HH = EE/z0;             	%磁场振幅
%% ===================设置仿真参数=====================
grid on;
z = [0:0.01:6];         		%沿z轴传播
zero=0*ones(size(z));
t=0;                    	% t=0时刻传播状态
%% ====================建立仿真量=====================
Ex = EE*exp(0*z).*cos(w*t-k*z+phi);
Hy = HH*exp(0*z).*cos(w*t-k*z+phi);
%% ===========描绘理想介质中t=0时刻波传播状态===========
% 电场传播
quiver3(z,zero,zero,zero,Ex,zero,1,'R','ShowArrowHead','off');
hold on;
% 磁场传播
quiver3(z,zero,zero,zero,zero,Hy,1,'B','ShowArrowHead','off');
hold off;
xlabel('电磁场传播方向','fontSize',12);
ylabel('电场方向','fontSize',12);
zlabel('磁场方向','fontSize',12);
title('理想介质t=0时刻平面电磁波传播示意图','fontsize',14);
axis([0,6,-0.5,0.5,-0.5,0.5]);
set(gca,'fontsize',10);
