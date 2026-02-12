import socket


def scan_range_ports (host, start_port, end_port, timeout=3):
    open_ports = []
    for port in range(start_port, end_port+1):
        if safe_scan_port(host, port, timeout):
            print(f"Port {port} is open")
            open_ports.append(port)
        else:
            print(f"Port {port} is closed")
    return open_ports


def safe_scan_port(host, port, timeout=3):
    try:
        sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        sock.settimeout(timeout)
        result = sock.connect_ex((host,port))
        sock.close()
        return result == 0
    except socket.gaierror:
        print(f"DNS resolution failed for {host}")
        return False
    except Exception as e:
        print(f"Scanning Error: {e}")
        return False


if __name__ == "__main__":
    #print(safe_scan_port("localhost", 8080))

    print(scan_range_ports("localhost", 8000, 8081,2))