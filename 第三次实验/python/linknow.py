# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'linknow.ui'
#
# Created by: PyQt5 UI code generator 5.15.0
#
# WARNING: Any manual changes made to this file will be lost when pyuic5 is
# run again.  Do not edit this file unless you know what you are doing.


from PyQt5 import QtCore, QtGui, QtWidgets


class Ui_MainWindow(object):
    def setupUi(self, MainWindow):
        MainWindow.setObjectName("MainWindow")
        MainWindow.resize(998, 577)
        self.centralwidget = QtWidgets.QWidget(MainWindow)
        self.centralwidget.setObjectName("centralwidget")
        self.groupBox = QtWidgets.QGroupBox(self.centralwidget)
        self.groupBox.setGeometry(QtCore.QRect(30, 30, 341, 271))
        self.groupBox.setAlignment(QtCore.Qt.AlignLeading|QtCore.Qt.AlignLeft|QtCore.Qt.AlignVCenter)
        self.groupBox.setObjectName("groupBox")
        self.verticalLayoutWidget_2 = QtWidgets.QWidget(self.groupBox)
        self.verticalLayoutWidget_2.setGeometry(QtCore.QRect(20, 30, 81, 221))
        self.verticalLayoutWidget_2.setObjectName("verticalLayoutWidget_2")
        self.verticalLayout_2 = QtWidgets.QVBoxLayout(self.verticalLayoutWidget_2)
        self.verticalLayout_2.setContentsMargins(0, 0, 0, 0)
        self.verticalLayout_2.setObjectName("verticalLayout_2")
        self.label_1 = QtWidgets.QLabel(self.verticalLayoutWidget_2)
        self.label_1.setAlignment(QtCore.Qt.AlignCenter)
        self.label_1.setObjectName("label_1")
        self.verticalLayout_2.addWidget(self.label_1)
        self.label_4 = QtWidgets.QLabel(self.verticalLayoutWidget_2)
        self.label_4.setAlignment(QtCore.Qt.AlignCenter)
        self.label_4.setObjectName("label_4")
        self.verticalLayout_2.addWidget(self.label_4)
        self.label_3 = QtWidgets.QLabel(self.verticalLayoutWidget_2)
        self.label_3.setAlignment(QtCore.Qt.AlignCenter)
        self.label_3.setObjectName("label_3")
        self.verticalLayout_2.addWidget(self.label_3)
        self.label_9 = QtWidgets.QLabel(self.verticalLayoutWidget_2)
        self.label_9.setLayoutDirection(QtCore.Qt.LeftToRight)
        self.label_9.setAlignment(QtCore.Qt.AlignCenter)
        self.label_9.setObjectName("label_9")
        self.verticalLayout_2.addWidget(self.label_9)
        self.verticalLayoutWidget = QtWidgets.QWidget(self.groupBox)
        self.verticalLayoutWidget.setGeometry(QtCore.QRect(100, 30, 160, 221))
        self.verticalLayoutWidget.setObjectName("verticalLayoutWidget")
        self.verticalLayout = QtWidgets.QVBoxLayout(self.verticalLayoutWidget)
        self.verticalLayout.setContentsMargins(0, 0, 0, 0)
        self.verticalLayout.setObjectName("verticalLayout")
        self.lineEdit1 = QtWidgets.QLineEdit(self.verticalLayoutWidget)
        self.lineEdit1.setAlignment(QtCore.Qt.AlignCenter)
        self.lineEdit1.setObjectName("lineEdit1")
        self.verticalLayout.addWidget(self.lineEdit1)
        self.lineEdit2 = QtWidgets.QLineEdit(self.verticalLayoutWidget)
        self.lineEdit2.setAlignment(QtCore.Qt.AlignCenter)
        self.lineEdit2.setObjectName("lineEdit2")
        self.verticalLayout.addWidget(self.lineEdit2)
        self.lineEdit3 = QtWidgets.QLineEdit(self.verticalLayoutWidget)
        self.lineEdit3.setAlignment(QtCore.Qt.AlignCenter)
        self.lineEdit3.setObjectName("lineEdit3")
        self.verticalLayout.addWidget(self.lineEdit3)
        self.lineEdit4 = QtWidgets.QLineEdit(self.verticalLayoutWidget)
        self.lineEdit4.setAlignment(QtCore.Qt.AlignCenter)
        self.lineEdit4.setObjectName("lineEdit4")
        self.verticalLayout.addWidget(self.lineEdit4)
        self.verticalLayoutWidget_3 = QtWidgets.QWidget(self.groupBox)
        self.verticalLayoutWidget_3.setGeometry(QtCore.QRect(260, 30, 61, 221))
        self.verticalLayoutWidget_3.setObjectName("verticalLayoutWidget_3")
        self.verticalLayout_3 = QtWidgets.QVBoxLayout(self.verticalLayoutWidget_3)
        self.verticalLayout_3.setContentsMargins(0, 0, 0, 0)
        self.verticalLayout_3.setObjectName("verticalLayout_3")
        self.label_5 = QtWidgets.QLabel(self.verticalLayoutWidget_3)
        self.label_5.setAlignment(QtCore.Qt.AlignCenter)
        self.label_5.setObjectName("label_5")
        self.verticalLayout_3.addWidget(self.label_5)
        self.label_6 = QtWidgets.QLabel(self.verticalLayoutWidget_3)
        self.label_6.setAlignment(QtCore.Qt.AlignCenter)
        self.label_6.setObjectName("label_6")
        self.verticalLayout_3.addWidget(self.label_6)
        self.label_7 = QtWidgets.QLabel(self.verticalLayoutWidget_3)
        self.label_7.setAlignment(QtCore.Qt.AlignCenter)
        self.label_7.setObjectName("label_7")
        self.verticalLayout_3.addWidget(self.label_7)
        self.label_8 = QtWidgets.QLabel(self.verticalLayoutWidget_3)
        self.label_8.setText("")
        self.label_8.setObjectName("label_8")
        self.verticalLayout_3.addWidget(self.label_8)
        self.comboBox = QtWidgets.QComboBox(self.centralwidget)
        self.comboBox.setGeometry(QtCore.QRect(110, 320, 181, 31))
        self.comboBox.setObjectName("comboBox")
        self.comboBox.addItem("")
        self.comboBox.addItem("")
        self.comboBox.addItem("")
        self.comboBox.addItem("")
        self.comboBox_2 = QtWidgets.QComboBox(self.centralwidget)
        self.comboBox_2.setGeometry(QtCore.QRect(110, 400, 181, 31))
        self.comboBox_2.setObjectName("comboBox_2")
        self.comboBox_2.addItem("")
        self.comboBox_2.addItem("")
        self.comboBox_2.addItem("")
        self.radioButton = QtWidgets.QRadioButton(self.centralwidget)
        self.radioButton.setGeometry(QtCore.QRect(80, 370, 115, 19))
        self.radioButton.setObjectName("radioButton")
        self.radioButton_2 = QtWidgets.QRadioButton(self.centralwidget)
        self.radioButton_2.setGeometry(QtCore.QRect(150, 370, 115, 19))
        self.radioButton_2.setObjectName("radioButton_2")
        self.pushButton = QtWidgets.QPushButton(self.centralwidget)
        self.pushButton.setGeometry(QtCore.QRect(160, 460, 93, 28))
        self.pushButton.setObjectName("pushButton")
        self.over = QtWidgets.QPushButton(self.centralwidget)
        self.over.setGeometry(QtCore.QRect(220, 360, 93, 28))
        self.over.setObjectName("over")
        self.label = QtWidgets.QLabel(self.centralwidget)
        self.label.setGeometry(QtCore.QRect(391, 50, 551, 411))
        self.label.setFrameShape(QtWidgets.QFrame.Box)
        self.label.setText("")
        self.label.setObjectName("label")
        MainWindow.setCentralWidget(self.centralwidget)
        self.menubar = QtWidgets.QMenuBar(MainWindow)
        self.menubar.setGeometry(QtCore.QRect(0, 0, 998, 26))
        self.menubar.setObjectName("menubar")
        MainWindow.setMenuBar(self.menubar)
        self.statusbar = QtWidgets.QStatusBar(MainWindow)
        self.statusbar.setObjectName("statusbar")
        MainWindow.setStatusBar(self.statusbar)
        self.comboBox.currentIndexChanged['QString'].connect(MainWindow.slot1)
        self.retranslateUi(MainWindow)
        QtCore.QMetaObject.connectSlotsByName(MainWindow)

    def retranslateUi(self, MainWindow):
        _translate = QtCore.QCoreApplication.translate
        MainWindow.setWindowTitle(_translate("MainWindow", "MainWindow"))
        self.groupBox.setTitle(_translate("MainWindow", "参数设置"))
        self.label_1.setText(_translate("MainWindow", "频率"))
        self.label_4.setText(_translate("MainWindow", "宽边"))
        self.label_3.setText(_translate("MainWindow", "窄边"))
        self.label_9.setText(_translate("MainWindow", "H10"))
        self.lineEdit1.setText(_translate("MainWindow", "9.375"))
        self.lineEdit2.setText(_translate("MainWindow", "22.86"))
        self.lineEdit3.setText(_translate("MainWindow", "10.16"))
        self.lineEdit4.setText(_translate("MainWindow", "1"))
        self.label_5.setText(_translate("MainWindow", "GHz"))
        self.label_6.setText(_translate("MainWindow", "mm"))
        self.label_7.setText(_translate("MainWindow", "mm"))
        self.comboBox.setItemText(0, _translate("MainWindow", "波导内电磁场"))
        self.comboBox.setItemText(1, _translate("MainWindow", "单次切片观察"))
        self.comboBox.setItemText(2, _translate("MainWindow", "多次切片观察"))
        self.comboBox.setItemText(3, _translate("MainWindow", "t=1时Ey曲面图"))
        self.comboBox_2.setItemText(0, _translate("MainWindow", "X平面"))
        self.comboBox_2.setItemText(1, _translate("MainWindow", "Y平面"))
        self.comboBox_2.setItemText(2, _translate("MainWindow", "Z平面"))
        self.radioButton.setText(_translate("MainWindow", "静态"))
        self.radioButton_2.setText(_translate("MainWindow", "动态"))
        self.pushButton.setText(_translate("MainWindow", "确定"))
        self.over.setText(_translate("MainWindow", "生成动图"))
