import db

fn (mut node P2PNode) handle_payload(payload string) {
    println('Node $node.id received: $payload')

    // Save payload status to DB
    mut database := db.new_db('db', 'p2p_user', 'p2p_password', 'p2p_db') or {
        panic('Failed to connect to DB')
    }
    database.save_payload(node.id, payload) or {
        println('Failed to save payload to DB: $err')
    }
}
