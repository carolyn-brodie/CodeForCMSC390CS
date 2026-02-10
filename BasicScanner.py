import socket

def scan_port(host, port):
    sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    sock.settimeout(3)
    result = sock.connect_ex((host, port))
    sock.close()
    return result == 0


if __name__ == "__main__":
    print(scan_port("127.0.0.1", 8080))