6%% ==================��ջ���=========================
clear;
clc;
close all;
%% =================��Ų�����========================
alpha = -0.08;          	%˥������
beta = 2*pi;            	%��λ����
w = 6*pi*1e8;
yeta = 1.20*pi;				%���迹
kecei = 0.25*pi;
EE = 20*sqrt(2);
HH = EE/yeta;
phi = 0;						%�糡��ʼ��λ
%% ==================�������========================
grid on;
x=[0:0.01:10];				%��x�ᴫ��
zero=zeros(size(x));
%% ==============����ý��������ʱ�̵�Ų�������̬ͼ======
aviobj = VideoWriter('electavi.avi');
aviobj.FrameRate = 3;
open(aviobj);
for t = 0:100            				%ʱ��������Ϊ��λ
    Ez=EE*exp(alpha*x).*cos(w*t*1e-9-beta*x-phi);
    Hy=HH*exp(alpha*x).*cos(w*t*1e-9-beta*x-kecei);
    quiver3(x,zero,zero,zero,zero,Ez,1,'R','ShowArrowHead','off');
    hold on;
    quiver3(x,zero,zero,zero,Hy,zero,1,'B','ShowArrowHead','off');
    hold off;
    xlabel('��ų���������','fontSize',12);
    ylabel('�ų�����','fontSize',12);
    zlabel('�糡����','fontSize',12);
    title(['��������е�Ų�������̬ʾ��ͼ','t=',num2str(t),'ns'],'fontsize',14);
    axis([0,6,-0.5,0.5,-0.5,0.5]);
    set(gca,'fontsize',10);
    CurrFrame = getframe;            	% ��ȡÿ֡ͼƬ
    writeVideo(aviobj, CurrFrame);   	% д��AVI�ļ���
end
close(aviobj);
