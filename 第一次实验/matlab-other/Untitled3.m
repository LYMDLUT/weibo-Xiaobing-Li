%% ==================��ջ���=========================
clear;
clc;
close all;
%% =================��Ų�����========================
alpha = -0.08;          	%˥������
beta = 2*pi;            	%��λ����
w = 6*pi*1e8;           	%��Ų�Ƶ��
yeta = 1.20*pi;         	%�����迹
kecei = 0.25*pi;        		%�ų���糡��λ��
EE = 20*sqrt(2);        	%�糡���
HH = EE/yeta;           	%�ų����
phi = 0;                	%�糡��ʼ��λ
%% ==================�������========================
grid on;
x=[0:0.01:10];          	%��Ų���x����
zero=zeros(size(x));
t=0;
%% =================����������=======================
Ez=EE*exp(alpha*x).*cos(w*t-beta*x-phi);
Hy=1/yeta*EE*exp(alpha*x).*cos(w*t-beta*x-kecei);
%% ========��浼��ý����t=0ʱ�̵�Ų�����״̬==========
%�糡
quiver3(x,zero,zero,zero,zero,Ez,'R','showarrowhead','off');
hold on;
%�ų�
quiver3(x,zero,zero,zero,Hy,zero,'B','showarrowhead','off');
hold off;
ti=title('���������t=0ʱ�̵�Ŵ���','color','k');
set(ti,'fontsize',16);
xlabel('��ų���������','fontSize',12);
ylabel('�ų�����','fontSize',12);
zlabel('�糡����','fontSize',12);
axis([0,5,-0.5,0.5,-0.5,0.5]);
