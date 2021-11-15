#Ejercicio 14 Programacion para ciberseguridad
#alumna: Ana Barbara Sarmiento Najera :)

import argparse
import smtplib
import getpass
import mimetypes
from email.mime.multipart import MIMEMultipart
from email.mime.image import MIMEImage
from email.mime.text import MIMEText
from email import encoders
correo1 = input("Ingresa el correo desde donde se enviara el correo: ") #1
pwd = getpass.getpass() #2
correo2 = input("Ingresa el destinatario: ") #3
asunto = input("Ingresa el asunto: ")#4
text = input("Ingresa el cuerpo del correo: ") #5
mensaje = MIMEText(text)
msg = MIMEMultipart()
msg['From']=correo1
msg['To']=correo2
msg['Subject']=asunto
imagen = input("Ingresa el nombre de la imagen: ") #6
nombre = input("Ingresa tu nombre completo: ")  #7
file = open(imagen, "rb")
attach_image = MIMEImage(file.read())
attach_image.add_header('Content-Disposition', 'attachment; filename = "imagen.jpg"')
msg.attach(attach_image)
msg.attach(mensaje)

mailServer = smtplib.SMTP('smtp.office365.com',587)
mailServer.ehlo()
mailServer.starttls()
mailServer.ehlo()
mailServer.login(correo1,pwd)

mailServer.sendmail(correo1, correo2, msg.as_string())  #enviar

mailServer.close()  #FIN!!!
