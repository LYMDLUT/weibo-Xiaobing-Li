%% ==================清空环境=========================
clear;
clc;
close all;
%% =================电磁波参数========================
alpha = -0.08;          	%衰减常数
beta = 2*pi;            	%相位常数
w = 6*pi*1e8;           	%电磁波频率
yeta = 1.20*pi;         	%复波阻抗
kecei = 0.25*pi;        		%磁场与电场相位差
EE = 20*sqrt(2);        	%电场振幅
HH = EE/yeta;           	%磁场振幅
phi = 0;                	%电场初始相位
%% ==================仿真参数========================
grid on;
x=[0:0.01:10];          	%电磁波沿x传播
zero=zeros(size(x));
t=0;
%% =================建立仿真量=======================
Ez=EE*exp(alpha*x).*cos(w*t-beta*x-phi);
Hy=1/yeta*EE*exp(alpha*x).*cos(w*t-beta*x-kecei);
%% ========描绘导电媒质中t=0时刻电磁波传播状态==========
%电场
quiver3(x,zero,zero,zero,zero,Ez,'R','showarrowhead','off');
hold on;
%磁场
quiver3(x,zero,zero,zero,Hy,zero,'B','showarrowhead','off');
hold off;
ti=title('导电介质中t=0时刻电磁传播','color','k');
set(ti,'fontsize',16);
xlabel('电磁场传播方向','fontSize',12);
ylabel('磁场方向','fontSize',12);
zlabel('电场方向','fontSize',12);
axis([0,5,-0.5,0.5,-0.5,0.5]);
