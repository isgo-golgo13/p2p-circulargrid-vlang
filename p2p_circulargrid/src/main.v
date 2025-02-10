import os
import node
import db

fn main() {
    port := os.args[1].int()
    db_host := os.getenv('DB_HOST')
    db_user := os.getenv('DB_USER')
    db_pass := os.getenv('DB_PASSWORD')
    db_name := os.getenv('DB_NAME')

    mut database := db.new_db(db_host, db_user, db_pass, db_name) or {
        panic('Failed to connect to database')
    }

    mut my_node := node.new_node(1, port, database)
    my_node.start() ?
}
