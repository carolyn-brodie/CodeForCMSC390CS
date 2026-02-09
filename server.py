import socket

HOST = "localhost"
PORT = 8080

server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
server_socket.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
server_socket.bind((HOST, PORT))
server_socket.listen(5)

print(f"Server listening on http://{HOST}:{PORT}")

try:
    while True:
        client_connection, client_address = server_socket.accept()
        print(f"Connection from {client_address}")

        request = client_connection.recv(1024).decode()
        print(request)

        response_body = "Hello, World!"
        response = (
            "HTTP/1.1 200 OK\r\n"
            f"Content-Length: {len(response_body)}\r\n"
            "Content-Type: text/plain\r\n"
            "Connection: close\r\n"
            "\r\n"
            f"{response_body}"
        )

        client_connection.sendall(response.encode())
        client_connection.close()

except KeyboardInterrupt:
    print("\nShutting down server...")

finally:
    server_socket.close()
