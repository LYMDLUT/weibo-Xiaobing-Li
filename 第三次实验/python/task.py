# -*- coding: utf-8 -*-
from PyQt5.QtWidgets import *
from PyQt5.QtGui import *
from PyQt5 import QtWidgets
import sys
import numpy as np
import matplotlib.pyplot as plt
from matplotlib.widgets import Button
import matplotlib.animation as animation
from linknow import Ui_MainWindow
from mpl_toolkits.mplot3d import Axes3D
plt.rc('font',family='MicroSoft YaHei',weight='bold')
from PIL import Image,ImageFilter
class mywindow(QMainWindow,Ui_MainWindow,QWidget):
    def __init__(self):
        super(mywindow, self).__init__()
        self.setupUi(self)
        self.pushButton.clicked.connect(self.queding)
        self.comboBox_2.hide()
        self.radioButton.setChecked(True)
        self.over.clicked.connect(self.jieshu)
        #self.over.hide()
    def jieshu(self):#生成动图图片
        u0 = 4 * np.pi * 10 ** (-7)
        e0 = 1 / (36 * np.pi) * 10 ** (-9)
        u = u0
        e = e0
        f = float(self.lineEdit1.text())* 10 ** 9 #9.375 * 10 ** 9
        w = 2 * np.pi * f
        a = float(self.lineEdit2.text())/1000#22.86 / 1000
        b = float(self.lineEdit3.text())/1000#10.16 / 1000
        H10 = float(self.lineEdit4.text())#1
        c = 299792458
        beta = w / c
        k = w * np.sqrt(u * e)
        lambda1 = 2 * np.pi * c / w
        d = 15
        lc = 2 * a  # TE10截止波长
        l0 = (3 * 10 ^ 8) / f
        # for t=0:10^(-9):5*10^(-8)
        #plt.close
        lg = l0 / ((1 - (l0 / lc) ** 2) ** 0.5)
        c = lg
        B = 2 * np.pi / lg
        x = np.arange(0, a, a / d)
        y = np.arange(0, b, b / d)
        z = np.arange(0, c, c / d)
        [x1, y1, z1] = np.meshgrid(x, y, z)
        fig = plt.figure()
        #plt.ion()
        ax = fig.gca(projection='3d')
        #def animate(t):
        f = float(self.lineEdit1.text()) * 10 ** 9  # 9.375 * 10 ** 9
        w = 2 * np.pi * f
        t=0
        T=2*np.pi/w
        for n in range(30):
        #while t<T:
            u0 = 4 * np.pi * 10 ** (-7)
            e0 = 1 / (36 * np.pi) * 10 ** (-9)
            u = u0
            e = e0
#
            a = float(self.lineEdit2.text())/1000  # 22.86 / 1000
            b = float(self.lineEdit3.text()) /1000 # 10.16 / 1000
            H10 = float(self.lineEdit4.text())  # 1
            c = 299792458
            beta = w / c
            k = w * np.sqrt(u * e)
            lambda1 = 2 * np.pi * c / w
            d = 15
            lc = 2 * a  # TE10截止波长
            l0 = (3 * 10 ^ 8) / f
#
            #############
            ex = np.zeros(np.size(x1))
            ey = w * u * a * H10 * np.sin(np.pi / a * x1) * np.sin(w * t - B * z1) / np.pi * 0.000000000002
            ez = np.zeros(np.size(z1))
            # fig = plt.figure()
            # ax = fig.gca(projection='3d')
            ax.quiver(z1, x1, y1, 0, 0, ey, color='r')
            # set(h,'maxheadsize',0);
            hx = (-1) * B * a * H10 * np.sin(np.pi / a * x1) * np.sin(w * t - B * z1) / np.pi
            hy = np.zeros(np.size(y1))
            hz = H10 * np.cos(np.pi / a * x1) * np.cos(w * t - B * z1)
            #for x, y, z, u, v, w in zip(z1, x1, y1, hz, hx, hy):
                #ax.quiver(x, y, z, u, v, w, color='deepskyblue', length=0.00000000008)
            ax.quiver(z1, x1, y1, hz, hx, 0, color='deepskyblue', length=0.00000000008)
            # set(h,'maxheadsize',0);
            # ax.set_title(['波导管内电磁场分布图','t=',num2str(t),'s']);
            # axis equal
            ax.set_xlabel('传输方向')
            ax.set_ylabel('波导宽边a')
            ax.set_zlabel('波导窄边b')
            #plt.pause(0.001)
            plt.savefig('./temp_image_wav1/' + str(n) + '.png')
            plt.cla()
            t = t + T / 50
        # animate(0)
        #ani = animation.FuncAnimation(fig, animate, np.arange(0, 5 * 10 ** (-8), 10 ** (-9)), interval=50,blit=False)
        #plt.ioff()
        #plt.show()
        plt.close()
    def slot1(self):#下拉菜单栏隐藏设计
        if self.comboBox.currentText() == '波导内电磁场':
            self.comboBox_2.hide()
            self.radioButton.show()
            self.radioButton_2.show()
            self.over.show()
        elif self.comboBox.currentText() == '单次切片观察':
            self.comboBox_2.show()
            self.radioButton.hide()
            self.radioButton_2.hide()
            self.over.hide()
        elif self.comboBox.currentText() == '多次切片观察':
            self.comboBox_2.show()
            self.radioButton.hide()
            self.radioButton_2.hide()
            self.over.hide()
        elif self.comboBox.currentText() == 't=1时Ey曲面图':
            self.comboBox_2.hide()
            self.radioButton.hide()
            self.radioButton_2.hide()
            self.over.hide()
    def queding(self):
        u0 = 4 * np.pi * 10 ** (-7)
        e0 = 1 / (36 * np.pi) * 10 ** (-9)
        u = u0
        e = e0
        f = float(self.lineEdit1.text())* 10 ** 9 #9.375 * 10 ** 9
        w = 2 * np.pi * f
        a = float(self.lineEdit2.text())/1000#22.86 / 1000
        b = float(self.lineEdit3.text())/1000#10.16 / 1000
        H10 = float(self.lineEdit4.text())#1
        c = 299792458
        beta = w / c
        k = w * np.sqrt(u * e)
        lambda1 = 2 * np.pi * c / w
        d = 15
        lc = 2 * a  # TE10截止波长
        l0 = (3 * 10 ^ 8) / f

        if self.comboBox.currentText() == '波导内电磁场':
            lg = l0 / ((1 - (l0 / lc) ** 2) ** 0.5)
            c = lg
            B = 2 * np.pi / lg
            x = np.arange(0, a, a / d)
            y = np.arange(0, b, b / d)
            z = np.arange(0, c, c / d)
            [x1, y1, z1] = np.meshgrid(x, y, z)
            if self.radioButton.isChecked() == True:#静态图
                ex = np.zeros(np.size(x1))
                ez = np.zeros(np.size(z1))
                # for t in np.arange(0,5*10**(-8),10**(-9)):
                t = 0
                ey = w * u * a * H10 * np.sin(np.pi / a * x1) * np.sin(w * t - B * z1) / np.pi * 0.000000000002
                #plt.close
                fig = plt.figure()
                # ax = Axes3D(fig)
                ax = fig.gca(projection='3d')
                ax.quiver(z1, x1, y1, 0, 0, ey,color='r')  # ,color='deepskyblue', width=0.005, scale=30,length=0.00000000001,pivot = 'middle'
                # ax.scatter(z1,x1,y1, color = 'black')
                # for x,y,z,u,v,w in zip(z1,x1,y1,ez,ex,ey):
                # ax.quiver(x, y, z, u, v, w,color='r',length=0.0000000001)
                # ax.quiver3D(z1,x1,y1,ez,ex,ey,color='deepskyblue',normalize=False)
                # hold on
                hx = (-1) * B * a * H10 * np.sin(np.pi / a * x1) * np.sin(w * t - B * z1) / np.pi
                hy = np.zeros(np.size(y1))
                hz = H10 * np.cos(np.pi / a * x1) * np.cos(w * t - B * z1)
                for x, y, z, u, v, w in zip(z1, x1, y1, hz, hx, hy):
                    ax.quiver(x, y, z, u, v, w, color='deepskyblue', length=0.00000000008)
                # ax.quiver3D(z1,x1,y1,hz,hx,0,color='r')
                ax.set_title('波导管内电磁场分布图')
                # ax.axis('equal')
                ax.set_xlabel('传输方向')
                ax.set_ylabel('波导宽边a')
                ax.set_zlabel('波导窄边b')
                # hold off
                png_1 = 'png1.png'
                plt.savefig(png_1)
                plt.close()
                pix = QPixmap('png1.png')
                self.label.setPixmap(pix)
                #lb2.setGeometry(0, 250, 500, 210)
                self.label.setScaledContents(True)  # 自适应QLabel大小

            elif self.radioButton_2.isChecked() == True:#动态图
#                 #######################动态
#                 # for t=0:10^(-9):5*10^(-8)
#                 #plt.close
#                 self.p=0
#                 fig = plt.figure()
#                 #plt.ion()
#                 ax = fig.gca(projection='3d')
#                 #def animate(t):
#                 f = float(self.lineEdit1.text()) * 10 ** 9  # 9.375 * 10 ** 9
#                 w = 2 * np.pi * f
#                 t=0
#                 T=2*np.pi/w
#                 for n in range(30):
#                 #while t<T:
#                     if self.p==1:
#                         plt.close()
#                         break
#                     u0 = 4 * np.pi * 10 ** (-7)
#                     e0 = 1 / (36 * np.pi) * 10 ** (-9)
#                     u = u0
#                     e = e0
#                     
#                     a = float(self.lineEdit2.text())/1000  # 22.86 / 1000
#                     b = float(self.lineEdit3.text()) /1000 # 10.16 / 1000
#                     H10 = float(self.lineEdit4.text())  # 1
#                     c = 299792458
#                     beta = w / c
#                     k = w * np.sqrt(u * e)
#                     lambda1 = 2 * np.pi * c / w
#                     d = 15
#                     lc = 2 * a  # TE10截止波长
#                     l0 = (3 * 10 ^ 8) / f
#                     
#                     #############
#                     ex = np.zeros(np.size(x1))
#                     ey = w * u * a * H10 * np.sin(np.pi / a * x1) * np.sin(w * t - B * z1) / np.pi * 0.000000000002
#                     ez = np.zeros(np.size(z1))
#                     # fig = plt.figure()
#                     # ax = fig.gca(projection='3d')
#                     ax.quiver3D(z1, x1, y1, 0, 0, ey, color='r')
#                     # set(h,'maxheadsize',0);
#                     hx = (-1) * B * a * H10 * np.sin(np.pi / a * x1) * np.sin(w * t - B * z1) / np.pi
#                     hy = np.zeros(np.size(y1))
#                     hz = H10 * np.cos(np.pi / a * x1) * np.cos(w * t - B * z1)
#                     #for x, y, z, u, v, w in zip(z1, x1, y1, hz, hx, hy):
#                         #ax.quiver(x, y, z, u, v, w, color='deepskyblue', length=0.00000000008)
#                     ax.quiver(z1, x1, y1, hz, hx, 0, color='deepskyblue', length=0.00000000008)
#                     # set(h,'maxheadsize',0);
#                     # ax.set_title(['波导管内电磁场分布图','t=',num2str(t),'s']);
#                     # axis equal
#                     ax.set_xlabel('传输方向')
#                     ax.set_ylabel('波导宽边a')
#                     ax.set_zlabel('波导窄边b')
#                     #plt.pause(0.001)
#                     plt.savefig('./temp_image_wav1/' + str(n) + '.png')
#                     plt.cla()
#                     t = t + T / 50
#                 # animate(0)
#                 #ani = animation.FuncAnimation(fig, animate, np.arange(0, 5 * 10 ** (-8), 10 ** (-9)), interval=50,blit=False)
#                 #plt.ioff()
#                 #plt.show()
#                 plt.close()
                images = []
                for n in range(30):
                    exec('a'+str(n)+'=Image.open("' + 'temp_image_wav1/' + str(n) +'.png")')
                    images.append(eval('a' + str(n)))

                images[0].save('wav1.gif',
                               save_all=True,
                               append_images=images[1:],
                               duration=100,
                               loop=0)
                self.gif = QMovie('wav1.gif')
                self.label.setMovie(self.gif)
                self.label.setScaledContents(True)
                self.gif.start()

        elif self.comboBox.currentText() == '单次切片观察':
            if self.comboBox_2.currentText() == 'X平面':
                #plt.close
                x = a / 2
                t = 0.0001
                z = np.arange(0, lambda1, lambda1 / d)
                hx = beta * a / np.pi * H10 * np.sin(np.pi * x / a) * np.cos(w * t - beta * z + np.pi / 2)
                # fig = plt.figure()
                fig, ax = plt.subplots()
                ax.plot(z, hx, c='b')
                ax.set_title('t = 0.0001时，宽边x = 11mm纵切，波导内Hx波形')
                ax.set_xlabel('传输方向z')
                #plt.show()
                png_1 = 'png2.png'
                plt.savefig(png_1)
                plt.close()
                pix = QPixmap('png2.png')
                self.label.setPixmap(pix)
                # lb2.setGeometry(0, 250, 500, 210)
                self.label.setScaledContents(True)  # 自适应QLabel大小
            elif self.comboBox_2.currentText() == 'Y平面':
                #plt.close
                x = a / 2
                t = 0.0001
                z = np.arange(0, lambda1, lambda1 / d)
                ey = w * u * a / np.pi * H10 * np.sin(np.pi * x / a) * np.cos(w * t - beta * z - np.pi / 2)
                fig, ax = plt.subplots()
                ax.plot(z, ey, c='r')
                ax.set_title('t=0.0001s时,宽边x=11mm纵切，波导内Ey波形')
                ax.set_xlabel('传输方向z')
                #plt.show()
                png_1 = 'png3.png'
                plt.savefig(png_1)
                plt.close()
                pix = QPixmap('png3.png')
                self.label.setPixmap(pix)
                # lb2.setGeometry(0, 250, 500, 210)
                self.label.setScaledContents(True)  # 自适应QLabel大小
            elif self.comboBox_2.currentText() == 'Z平面':
                #plt.close
                z = 3
                t = 0.0001
                x = np.arange(0, lambda1, lambda1 / d)
                hz = H10 * np.cos(np.pi * x / a) * np.cos(w * t - beta * z)
                fig, ax = plt.subplots()
                ax.plot(x, hz, c='y')
                ax.set_title('t=0.0001s,传播方向z=3横断面处，波导内Hz强度波形')
                ax.set_xlabel('宽边x方向')
                #plt.show()
                png_1 = 'png4.png'
                plt.savefig(png_1)
                plt.close()
                pix = QPixmap('png4.png')
                self.label.setPixmap(pix)
                # lb2.setGeometry(0, 250, 500, 210)
                self.label.setScaledContents(True)  # 自适应QLabel大小
        elif self.comboBox.currentText() == '多次切片观察':
            if self.comboBox_2.currentText() == 'X平面':
                #plt.close
                fig, ax = plt.subplots()
                nn=-1
                for z in np.arange(0, 0.1/4, 0.001):
                    nn=nn+1
                #def animate(z):
                    x = np.arange(-a, 0, lambda1 / 10)
                    # for z  in np.arange(0,0.1,0.001):
                    for t in np.arange(0, 0.0001, 0.0001):
                        Hx = beta * a / np.pi * H10 * np.sin(np.pi * x / a) * np.cos(w * t - beta * z + np.pi / 2)
                        plt.plot(x, Hx)
                        # plt.axis([ -a, 0 , -inf , inf])
                        plt.xlim(-a, 0)
                        # plt.ylim(float("-inf"),float("inf"))
                        plt.title('波导内Hx强度波形')
                        plt.xlabel('宽边x方向')
                        #plt.pause(0.01)
                # 参数：每一帧返回的图像实例，绘制每一帧的函数，动画长度，
                #       是否启用一个函数来刷新，如果不设置则用第二个参数的第一帧刷新
                #       帧率？貌似是
                #       是否刷新所有的点
                #ani = animation.FuncAnimation(fig, animate, np.arange(0, 0.1/4, 0.001), interval=50, blit=False)
                # animate()
                #plt.show()
                        plt.savefig('./temp_image_wav3/' + str(nn) + '.png')
                plt.close()
                images = []
                for n in range(nn):
                    exec('a'+str(n)+'=Image.open("' + 'temp_image_wav3/' + str(n) +'.png")')
                    images.append(eval('a' + str(n)))

                images[0].save('wav3.gif',
                               save_all=True,
                               append_images=images[1:],
                               duration=100,
                               loop=0)
                self.gif = QMovie('wav3.gif')
                self.label.setMovie(self.gif)
                self.label.setScaledContents(True)
                self.gif.start()
            elif self.comboBox_2.currentText() == 'Y平面':
                fig, ax = plt.subplots()
                nn=-1
                for z in np.arange(0, 0.1/4, 0.001):
                    nn=nn+1
                    x = np.arange(-a, 0, lambda1 / 10)
                    for t in np.arange(0, 0.0001, 0.0001):
                        Ey = w * u * a / np.pi * H10 * np.sin(np.pi * x / a) * np.cos(w * t - beta * z - np.pi / 2)
                        plt.plot(x, Ey)
                        # axis([ -a , 0 , -inf , inf])
                        plt.xlim(-a, 0)
                        plt.title('波导内Ey强度波形')
                        plt.xlabel('宽边x方向')
                        #plt.pause(0.01)
                        plt.savefig('./temp_image_wav2/' + str(nn) + '.png')
                plt.close()
                images = []
                for n in range(nn):
                    exec('a'+str(n)+'=Image.open("' + 'temp_image_wav2/' + str(n) +'.png")')
                    images.append(eval('a' + str(n)))

                images[0].save('wav2.gif',
                               save_all=True,
                               append_images=images[1:],
                               duration=100,
                               loop=0)
                self.gif = QMovie('wav2.gif')#生成动图图片
                self.label.setMovie(self.gif)
                self.label.setScaledContents(True)
                self.gif.start()
            elif self.comboBox_2.currentText() == 'Z平面':
                #plt.close
                fig, ax = plt.subplots()
                nn=-1
                for z in np.arange(0, 0.1/4, 0.001):
                    nn=nn+1
                    x = np.arange(-a, 0, lambda1 / 10)
                    for t in np.arange(0, 0.0001, 0.0001):
                        Hz = H10 * np.cos(np.pi * x / a) * np.cos(w * t - beta * z)
                        plt.plot(x, Hz)
                        # axis([ -a , 0 , -inf , inf])
                        plt.xlim(-a, 0)
                        plt.title('波导内Hz强度波形')
                        plt.xlabel('宽边x方向')
                #ani = animation.FuncAnimation(fig, animate, np.arange(0, 0.1/4, 0.001), interval=50, blit=False)
                        #plt.pause(0.01)
                        plt.savefig('./temp_image_wav4/' + str(nn) + '.png')
                #plt.show()
                plt.close()
                images = []
                for n in range(nn):
                    exec('a'+str(n)+'=Image.open("' + 'temp_image_wav4/' + str(n) +'.png")')
                    images.append(eval('a' + str(n)))

                images[0].save('wav4.gif',
                               save_all=True,
                               append_images=images[1:],
                               duration=100,
                               loop=0)
                self.gif = QMovie('wav4.gif')#生成动图图片
                self.label.setMovie(self.gif)
                self.label.setScaledContents(True)
                self.gif.start()

        elif self.comboBox.currentText() == 't=1时Ey曲面图':
            #self.comboBox_2.hide()
            #fig.close()
            lg = lambda1 / ((1 - (lambda1 / lc) ** 2) ** 0.5)
            B = 2 * np.pi / lg
            w = 2 * np.pi * f
            t = 1
            x = np.arange(0, a, a / d)
            z = np.arange(0, lg, lg / d)
            [x21, z21] = np.meshgrid(x, z)
            Ey = w * u * a * H10 * np.sin(np.pi / a * x21) * np.sin(w * t - B * z21) / np.pi
            # print(Ey)
            fig1 = plt.figure()
            ax1 = fig1.gca(projection='3d')
            #ax = Axes3D(fig)
            ax1.plot_surface(x21, z21, Ey)
            ax1.set_title('任意x处,Ey电场大小')
            ax1.set_ylabel('传输方向z')
            ax1.set_xlabel('波导宽边a')
            ax1.set_zlabel('波导窄边b')
            #plt.show()
            png_1 = 'png5.png'
            plt.savefig(png_1)
            plt.close()
            pix = QPixmap('png5.png')
            self.label.setPixmap(pix)
            # lb2.setGeometry(0, 250, 500, 210)
            self.label.setScaledContents(True)  # 自适应QLabel大小
if __name__ == '__main__':
    app = QApplication(sys.argv)
    window = mywindow()
    window.show()
    sys.exit(app.exec_())