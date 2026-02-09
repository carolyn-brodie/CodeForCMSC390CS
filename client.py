from socket import socket
from urllib import request

def try_connection(host, port):
    client_socket = socket()
    client_socket.connect((host, port))
    message = f'GET / HTTP/1.1\r\nHost: {host}:{port}\r\n\r\n'
    client_socket.send(message.encode('utf-8'))

    response = client_socket.recv(1024)
    print(response.decode())
    client_socket.close()



if __name__ == "__main__":
    #try_connection("localhost", 8080)
    try_connection("10.2.160.176", 8080)


