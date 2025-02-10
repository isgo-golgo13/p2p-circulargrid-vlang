module db

import database.pg
import time

// Database connection
struct DB {
    conn pg.DB
}

// Initialize PostgreSQL connection
fn new_db(host string, user string, password string, dbname string) ?DB {
    conn := pg.connect('host=$host user=$user password=$password dbname=$dbname sslmode=disable') ?
    return DB{conn}
}

// Insert payload into DB
fn (db DB) save_payload(node_id int, payload string) ? {
    sql := 'INSERT INTO p2p_payloads (node_id, payload, received_at) VALUES ($1, $2, $3);'
    db.conn.exec(sql, node_id, payload, time.now().str()) ?
}
