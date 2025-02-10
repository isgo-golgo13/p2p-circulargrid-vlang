module node

import network
import db
import node_payload

struct P2PNode {
    id int
    network network.P2PNetwork
    database db.DB
}

// Create a new P2P node
fn new_node(id int, port int, db_config db.DB) P2PNode {
    return P2PNode{
        id: id
        network: network.P2PNetwork{port: port}
        database: db_config
    }
}

// Start the node’s server
fn (mut node P2PNode) start() ? {
    go node.network.start_server()
}

// Send a payload to a peer
fn (mut node P2PNode) send_payload(peer_addr string, message string) ? {
    mut conn := net.dial_tcp(peer_addr) ?
    conn.write(message.bytes()) ?

    // Store payload in database
    node.database.save_payload(node.id, message) ?
    println('Message sent and logged')
}
