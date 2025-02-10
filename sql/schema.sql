CREATE TABLE p2p_payloads (
    id SERIAL PRIMARY KEY,
    node_id INT NOT NULL,
    payload TEXT NOT NULL,
    received_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
