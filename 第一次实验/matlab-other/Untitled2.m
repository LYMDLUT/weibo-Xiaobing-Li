%% =====================��ջ���===========================
clear;
clc;
close all;
%% ===================���õ�ų�����========================
u0 = 4*pi*1e-7;         	%��մŵ���
e0 = 1/(36*pi)*1e-9;    		%���ɿռ��糣��
z0= sqrt(u0/e0);        		%���迹
k = 2*pi;               	%����
w = 6*pi*1e8;
phi = 0;                	%��ʼ��λ
EE = 20*sqrt(2);       	 	%�糡���
HH = EE/z0;             	%�ų����
%% ====================���÷������========================
grid on;
z = [0:0.01:6];         		%��z�ᴫ��
zero=0*ones(size(z));
%% =============�����������е�Ų�������ͼ=================
aviobj = VideoWriter('idealavi.avi');
aviobj.FrameRate = 3;
open(aviobj);
for t = 0:50            				%ʱ��������Ϊ��λ
    Ex = EE*exp(0*z).*cos(w*t*1e-9-k*z+phi);
    Hy = HH*exp(0*z).*cos(w*t*1e-9-k*z+phi);
    quiver3(z,zero,zero,zero,Ex,zero,1,'R','ShowArrowHead','off');
    hold on;
    quiver3(z,zero,zero,zero,zero,Hy,1,'B','ShowArrowHead','off');
    hold off;
    xlabel('��ų���������','fontSize',12);
    ylabel('�糡����','fontSize',12);
    zlabel('�ų�����','fontSize',12);
    title(['�������ƽ���Ų�������̬ʾ��ͼ','t=',num2str(t),'ns'],'fontsize',14);
    axis([0,6,-0.5,0.5,-0.5,0.5]);
    set(gca,'fontsize',10);
    CurrFrame = getframe;            % ��ȡÿ֡ͼƬ
    writeVideo(aviobj, CurrFrame);   	% д��AVI�ļ���
end
close(aviobj);
