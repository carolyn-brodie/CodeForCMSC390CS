from socket import socket
from urllib import request

client_socket = socket()
client_socket.connect(('localhost', 8080))
client_socket.send(b'GET / HTTP/1.1\r\nHost: localhost:8080\r\n\r\n')

response = client_socket.recv(1024)
print(response.decode())
client_socket.close()
#print(client_socket.send(request.encode('utf-8'))
#client_socket.connect(("example.com", 80))
