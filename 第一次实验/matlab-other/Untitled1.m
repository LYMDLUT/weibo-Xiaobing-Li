%% =====================��ջ���=======================
clear;
clc;
close all;
%% ==================���õ�ų�����====================
u0 = 4*pi*1e-7;         	%��մŵ���
e0 = 1/(36*pi)*1e-9;    		% ���ɿռ��糣��
z0= sqrt(u0/e0);
k = 2*pi;               	%���迹
w = 6*pi*1e8;           	%��Ų�Ƶ��
phi = 0;               	%��ʼ��λ
EE = 20*sqrt(2);        	%�糡���
HH = EE/z0;             	%�ų����
%% ===================���÷������=====================
grid on;
z = [0:0.01:6];         		%��z�ᴫ��
zero=0*ones(size(z));
t=0;                    	% t=0ʱ�̴���״̬
%% ====================����������=====================
Ex = EE*exp(0*z).*cos(w*t-k*z+phi);
Hy = HH*exp(0*z).*cos(w*t-k*z+phi);
%% ===========������������t=0ʱ�̲�����״̬===========
% �糡����
quiver3(z,zero,zero,zero,Ex,zero,1,'R','ShowArrowHead','off');
hold on;
% �ų�����
quiver3(z,zero,zero,zero,zero,Hy,1,'B','ShowArrowHead','off');
hold off;
xlabel('��ų���������','fontSize',12);
ylabel('�糡����','fontSize',12);
zlabel('�ų�����','fontSize',12);
title('�������t=0ʱ��ƽ���Ų�����ʾ��ͼ','fontsize',14);
axis([0,6,-0.5,0.5,-0.5,0.5]);
set(gca,'fontsize',10);
