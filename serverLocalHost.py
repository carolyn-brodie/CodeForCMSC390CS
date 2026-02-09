import socket

server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
server_socket.bind(("localhost", 8080))
server_socket.listen(1)
print("Server listening on port localhost:8080")
client_connection, client_address = server_socket.accept()
print(f"Connection from {client_address}")
data = client_connection.recv(1024)
print(f"Received {data.decode()}")
response = "HTTP/1.1 200 OK\r\n\r\nHello, World!"
client_connection.send(response.encode())
client_connection.close()
server_socket.close()