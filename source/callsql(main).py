#Main program

import sys
from PyQt5.QtWidgets import QMainWindow, QApplication, QComboBox
from sqlwindow import *
import mysql.connector as mysql
from mysql.connector import Error
db = mysql.connect(user='root', password='0000', host='127.0.0.1', database='db')

class MainWindow(QtWidgets.QMainWindow):
    def __init__(self):
        super(MainWindow, self).__init__()
        self.ui = Ui_MainWindow()
        self.ui.setupUi(self)
        self.ui.pushButton.clicked.connect(self.query1)
        self.ui.pushButton_2.clicked.connect(self.query2)

    def query1(self):
        try:
            cursor = db.cursor()
            command = self.ui.lineEdit.text()
            print(command)
            cursor.execute(command)
            result = cursor.fetchall()

            self.ui.textBrowser.setText(str(result))

        except Error as e:
            print('ERROR COMMAND')

    def query2(self):
        try:
            cursor = db.cursor()
            if self.ui.comboBox.currentText() == 'SELECT-FROM-WHERE':
                if self.ui.lineEdit_2.text():
                    command = 'SELECT ' + self.ui.comboBox_2.currentText() + ' FROM ' + self.ui.comboBox_3.currentText() + ' WHERE ' + self.ui.lineEdit_2.text()
                    cursor.execute(command)
                    result = cursor.fetchall()
                    self.ui.textBrowser.setText(str(result))
                else:
                    command = 'SELECT ' + self.ui.comboBox_2.currentText() + ' FROM ' + self.ui.comboBox_3.currentText()
                    cursor.execute(command)
                    result = cursor.fetchall()
                    self.ui.textBrowser.setText(str(result))
            elif self.ui.comboBox.currentText() == 'DELETE':
                command = 'DELETE FROM ' + self.ui.comboBox_3.currentText() + ' WHERE ' + self.ui.lineEdit_2.text()
                cursor.execute(command)
            elif self.ui.comboBox.currentText() == 'INSERT':
                command = 'INSERT INTO ' + self.ui.comboBox_3.currentText() + ' VALUES (' + self.ui.lineEdit_3.text() + ')'
                cursor.execute(command)
            elif self.ui.comboBox.currentText() == 'UPDATE':
                command = 'UPDATE ' + self.ui.comboBox_3.currentText() + ' SET ' + self.ui.lineEdit_4.text() + ' WHERE ' + self.ui.lineEdit_2.text()
                cursor.execute(command)
            elif self.ui.comboBox.currentText() == 'IN':
                if self.ui.comboBox_4.currentText() == 'None':
                    command = 'SELECT ' + self.ui.comboBox_2.currentText() + ' FROM ' + self.ui.comboBox_3.currentText() + ' WHERE ' + self.ui.lineEdit_2.text()
                    cursor.execute(command)
                    result = cursor.fetchall()
                    self.ui.textBrowser.setText(str(result))
                else:
                    if self.ui.lineEdit_5.text():
                        command = 'SELECT ' + self.ui.comboBox_2.currentText() + ' FROM ' + self.ui.comboBox_3.currentText() + ' WHERE ' + self.ui.lineEdit_2.text() + ' IN (' + 'SELECT ' + self.ui.comboBox_4.currentText() + ' FROM ' + self.ui.comboBox_5.currentText() + ' WHERE ' + self.ui.lineEdit_5.text() + ')'
                    else:
                        command = 'SELECT ' + self.ui.comboBox_2.currentText() + ' FROM ' + self.ui.comboBox_3.currentText() + ' WHERE ' + self.ui.lineEdit_2.text() + ' IN (' + 'SELECT ' + self.ui.comboBox_4.currentText() + ' FROM ' + self.ui.comboBox_5.currentText() + ')'

                    cursor.execute(command)
                    result = cursor.fetchall()
                    self.ui.textBrowser.setText(str(result))
            elif self.ui.comboBox.currentText() == 'NOT IN':
                if self.ui.comboBox_4.currentText() == 'None':
                    command = 'SELECT ' + self.ui.comboBox_2.currentText() + ' FROM ' + self.ui.comboBox_3.currentText() + ' WHERE ' + self.ui.lineEdit_2.text()
                    cursor.execute(command)
                    result = cursor.fetchall()
                    self.ui.textBrowser.setText(str(result))
                else:
                    if self.ui.lineEdit_5.text():
                        command = 'SELECT ' + self.ui.comboBox_2.currentText() + ' FROM ' + self.ui.comboBox_3.currentText() + ' WHERE ' + self.ui.lineEdit_2.text() + ' NOT IN (' + 'SELECT ' + self.ui.comboBox_4.currentText() + ' FROM ' + self.ui.comboBox_5.currentText() + ' WHERE ' + self.ui.lineEdit_5.text() + ')'
                    else:
                        command = 'SELECT ' + self.ui.comboBox_2.currentText() + ' FROM ' + self.ui.comboBox_3.currentText() + ' WHERE ' + self.ui.lineEdit_2.text() + ' NOT IN (' + 'SELECT ' + self.ui.comboBox_4.currentText() + ' FROM ' + self.ui.comboBox_5.currentText() + ')'

                    cursor.execute(command)
                    result = cursor.fetchall()
                    self.ui.textBrowser.setText(str(result))
            elif self.ui.comboBox.currentText() == 'EXISTS':
                if self.ui.comboBox_4.currentText() != 'None':
                    command = 'SELECT ' + self.ui.comboBox_2.currentText() + ' FROM ' + self.ui.comboBox_3.currentText() + ' WHERE ' + ' EXISTS (' + 'SELECT ' + self.ui.comboBox_4.currentText() + ' FROM ' + self.ui.comboBox_5.currentText() + ' WHERE ' + self.ui.lineEdit_5.text() +')'

                    cursor.execute(command)
                    result = cursor.fetchall()
                    self.ui.textBrowser.setText(str(result))
            elif self.ui.comboBox.currentText() == 'NOT EXISTS':
                if self.ui.comboBox_4.currentText() != 'None':
                    command = 'SELECT ' + self.ui.comboBox_2.currentText() + ' FROM ' + self.ui.comboBox_3.currentText() + ' WHERE ' + ' NOT EXISTS (' + 'SELECT ' + self.ui.comboBox_4.currentText() + ' FROM ' + self.ui.comboBox_5.currentText() + ' WHERE ' + self.ui.lineEdit_5.text() +')'

                    cursor.execute(command)
                    result = cursor.fetchall()
                    self.ui.textBrowser.setText(str(result))
            elif self.ui.comboBox.currentText() == 'COUNT':
                command = 'SELECT ' + 'COUNT(' + self.ui.comboBox_7.currentText() + ') ' + ' FROM ' + self.ui.comboBox_3.currentText()
                cursor.execute(command)
                result = cursor.fetchall()
                self.ui.textBrowser.setText(str(result))
            elif self.ui.comboBox.currentText() == 'SUM':
                command = 'SELECT ' + 'SUM(' + self.ui.comboBox_7.currentText() + ') ' + ' FROM ' + self.ui.comboBox_3.currentText()
                cursor.execute(command)
                result = cursor.fetchall()
                self.ui.textBrowser.setText(str(result))
            elif self.ui.comboBox.currentText() == 'MAX':
                command = 'SELECT ' + 'MAX(' + self.ui.comboBox_7.currentText() + ') ' + ' FROM ' + self.ui.comboBox_3.currentText()
                cursor.execute(command)
                result = cursor.fetchall()
                self.ui.textBrowser.setText(str(result))
            elif self.ui.comboBox.currentText() == 'MIN':
                command = 'SELECT ' + 'MIN(' + self.ui.comboBox_7.currentText() + ') ' + ' FROM ' + self.ui.comboBox_3.currentText()
                cursor.execute(command)
                result = cursor.fetchall()
                self.ui.textBrowser.setText(str(result))
            elif self.ui.comboBox.currentText() == 'AVG':
                command = 'SELECT ' + 'AVG(' + self.ui.comboBox_7.currentText() + ') ' + ' FROM ' + self.ui.comboBox_3.currentText()
                cursor.execute(command)
                result = cursor.fetchall()
                self.ui.textBrowser.setText(str(result))
            else:
                if self.ui.lineEdit_2.text():
                    command = 'SELECT ' + self.ui.comboBox_2.currentText() + ' FROM ' + self.ui.comboBox_3.currentText() + ' WHERE ' + self.ui.lineEdit_2.text() + ' ' + self.ui.lineEdit_5.text()
                    cursor.execute(command)
                    result = cursor.fetchall()
                    self.ui.textBrowser.setText(str(result))
                else:
                    command = 'SELECT ' + self.ui.comboBox_2.currentText() + ' FROM ' + self.ui.comboBox_3.currentText() + ' ' + self.ui.lineEdit_2.text() + self.ui.lineEdit_5.text()
                    print(command)
                    cursor.execute(command)
                    result = cursor.fetchall()
                    self.ui.textBrowser.setText(str(result))
        except Error as e:
            print('ERROR COMMAND')

if __name__ == "__main__":
    app = QApplication(sys.argv)
    window = MainWindow()
    window.show()
    sys.exit(app.exec_())