from task1_gui import Ui_MainWindow
from PyQt5.QtWidgets import *
from PyQt5.QtGui import *
from PyQt5 import QtWidgets
import sys
import numpy as np
import matplotlib.pyplot as plt
from PIL import Image,ImageFilter


class Show(QMainWindow, Ui_MainWindow, QWidget):
    def __init__(self):
        super(Show, self).__init__()
        self.setupUi(self)
        self.callBackFunction()
        self.wav1_show.setText('就绪\n\n请更改输入参数否则为默认值\n\n修改完成后点击生成')
        self.wav2_show.setText('就绪\n\n请更改输入参数否则为默认值\n\n修改完成后点击生成')

    def callBackFunction(self):
        self.pb1.clicked.connect(self.generate_wav1_gif)
        self.pb2.clicked.connect(self.show_wav1_gif)
        self.pb3.clicked.connect(self.generate_wav2_gif)
        self.pb4.clicked.connect(self.show_wav2_gif)

    def generate_wav1_gif(self):
        A = float(self.wav1_A.text())          # 电场强度振幅值
        B_0 = float(self.wav1_B.text()) * np.pi                        # 初始相位
        W = float(self.wav1_W.text()) * np.pi * (10 ** 8)
        k_0 = float(self.wav1_k.text()) * np.pi
        u_0 = 4 * np.pi * (10 ** -7)    # 真空磁导率
        yi_0 = (1 / (36 * np.pi)) * (10 ** -9)  # 真空介电常数
        t = 0
        z = np.linspace(0, 15, 1600)
        zero = np.zeros(len(z))
        ni = np.sqrt(u_0 / yi_0)
        self.wav1_show.setText('正在生成动图')
        QtWidgets.QApplication.processEvents()
        frames = 30
        for n in range(frames):
            E = A * np.cos(W * t - k_0 * z + B_0)
            H = A / ni * np.cos(W * t - k_0 * z + B_0)
            fig = plt.figure()
            fig.tight_layout()
            ax = fig.add_subplot(111, projection='3d')
            ax.set_xlim(0, 15)
            ax.set_zlim(-A, A)
            ax.set_ylim(-A / ni, A / ni)
            ax.plot(z, zero, E, label="electric")
            ax.plot(z, H, zero, color='r', label="magnetic")
            plt.legend()
            ax.set_xlabel('Electromagnetic wave propagation direction')
            ax.set_ylabel('Direction of magnetic change')
            ax.set_zlabel('Direction of electric change')
            plt.savefig('./temp_image_wav1/' + str(n) + '.png')
            plt.close()
            t += 1/(2 * W)
        images = []
        for n in range(frames):
            exec('a'+str(n)+'=Image.open("' + 'temp_image_wav1/' + str(n) +'.png")')
            images.append(eval('a' + str(n)))

        images[0].save('wav1.gif',
                       save_all=True,
                       append_images=images[1:],
                       duration=100,
                       loop=0)
        self.wav1_show.setText('动图生成完成，点击播放显示')

    def show_wav1_gif(self):
        self.gif = QMovie('wav1.gif')
        self.label.setMovie(self.gif)
        self.gif.start()
        self.wav1_show.setText('播放中\n\n此时可以更改参数再次点击生成')

    def generate_wav2_gif(self):
        A = float(self.wav2_A.text())  # 电场强度振幅值
        W = float(self.wav2_W.text()) * np.pi * (10 ** 8)
        ni_c = float(self.wav2_ni.text())*np.pi
        alf = float(self.wav2_alf.text())
        kes = float(self.wav2_kes.text()) * np.pi
        bat = float(self.wav2_bat.text())
        t = 0
        z = np.linspace(0, 15, 1600)
        zero = np.zeros(len(z))

        self.wav2_show.setText('正在生成动图')
        QtWidgets.QApplication.processEvents()

        E = A * np.exp(-alf * z)*np.cos(W*t-bat*z)
        H = A/ni_c * np.exp(-alf * z)*np.cos(W*t-bat*z-kes)

        frames = 30
        for n in range(frames):
            E = A * np.exp(-alf * z) * np.cos(W * t - bat*z)
            H = A / ni_c * np.exp(-alf * z) * np.cos(W * t - bat*z - kes)
            fig = plt.figure()
            fig.tight_layout()
            ax = fig.add_subplot(111,projection='3d')
            ax.set_xlim(0, 15)
            ax.set_zlim(-A, A)
            ax.set_ylim(-A / ni_c, A / ni_c)
            ax.plot(z, zero, E, label="electric")
            ax.plot(z, H, zero, color='r', label="magnetic")
            plt.legend()
            ax.set_xlabel('Electromagnetic wave propagation direction')
            ax.set_ylabel('Direction of magnetic change')
            ax.set_zlabel('Direction of electric change')
            plt.savefig('./temp_image_wav2/' + str(n) + '.png')
            plt.close()
            t += 1 / (2 * W)
        images = []
        for n in range(frames):
            exec('a' + str(n) + '=Image.open("' + './temp_image_wav2/' + str(n) + '.png")')
            images.append(eval('a' + str(n)))
        images[0].save('wav2.gif',
                       save_all=True,
                       append_images=images[1:],
                       duration=100,
                       loop=0)
        self.wav2_show.setText('动图生成完成，点击播放显示')

    def show_wav2_gif(self):
        self.gif = QMovie('wav2.gif')
        self.label_2.setMovie(self.gif)
        self.gif.start()
        self.wav2_show.setText('播放中\n\n此时可以更改参数再次点击生成')


if __name__ == '__main__':
    app = QApplication(sys.argv)
    ui = Show()
    ui.show()
    sys.exit(app.exec_())