module network

import net
import node_payload

pub struct P2PNetwork {
    port int
    connections []net.TcpConn
}

// Start a TCP server
pub fn (mut network P2PNetwork) start_server() ? {
    listener := net.listen_tcp(.ip, ':${network.port}') ?
    println('Node listening on port ${network.port}...')

    for {
        mut conn := listener.accept() ?
        go network.handle_connection(mut conn)
    }
}

// Handle incoming connections
fn (mut network P2PNetwork) handle_connection(mut conn net.TcpConn) {
    mut buf := []u8{len: 1024}
    for {
        len := conn.read(mut buf) or { break }
        payload := buf[..len].bytestr()
        println('Received message: $payload')
    }
}

// Connect to a peer node
pub fn (mut network P2PNetwork) connect_to_peer(peer_addr string) ? {
    conn := net.dial_tcp(peer_addr) ?
    network.connections << conn
    println('Connected to peer at $peer_addr')
}
