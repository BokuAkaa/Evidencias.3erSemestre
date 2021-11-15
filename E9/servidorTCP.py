import socket
import argparse
from cryptography.fernet import Fernet

TCP_IP = '127.0.0.1' 
TCP_PORT = 5005 #Puedes poner otro, verifica que no lo uses ya y que sea el mismo en el cliente tcp. 
BUFFER_SIZE = 2048 
#Se crea el Conector TCP/IP
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.bind((TCP_IP, TCP_PORT))
s.listen(1)
(conn, addr) = s.accept()
print ('Direccion de conexion:', addr)
while True:
  mjs_cifrado = conn.recv(BUFFER_SIZE)
  conn.send(b"Enterado. Bye!")
  break
conn.close()
file = open('clave.key', 'rb')
clave = file.read()
file.close()
cipher_suite = Fernet(clave)
mensajeBytes= cipher_suite.decrypt(mjs_cifrado,None)
mensaje = mensajeBytes.decode()
print("Mensaje recibido:\n",mensaje)