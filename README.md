# P2P Node Connector Grid using V
P2P Node Connector Grid as a CircularList using V Lanugage


## Project Architecture
Develop a circular linked list in V where each linked list node acts a P2P socket node with bidirectional connections to its adjacents. This design assures that each node:

- Sustains forward and reverse connections to its adjacents.
- Talks using (UDP, TCP) sockets 
- Creates a self-healing network if nodes leave or join

### Workflow Apporoach

- Each P2P linked list node will have:
    - A unique identifier (ID)
    - A socket connection
    - Pointers to the previous and next P2P linked list node
- P2P nodes talk TCP for guaranteed delivery and UDP (for low-latency) exchanges.
- If a P2P node leaves, the network updates the links dynamically

## Project Structure

```shell
p2p-v-network/
│── Dockerfile
│── docker-compose.yml
│── go.mod
│── .dockerignore
│── README.md
│── src/
│   ├── main.v
│   ├── node.v
│   ├── network.v
│   ├── node_payload.v
│   ├── db/
│   │   ├── repository.v  # Repository pattern for database access
│   │   ├── models.v      # Defines database models
│── scripts/
│   ├── build.sh
│   ├── run.sh
│── config/
│   ├── config.toml
│── sql/
│   ├── schema.sql  # SQL schema file
│── tests/
│   ├── test_network.v
│   ├── test_node.v
│   ├── test_db.v
```

## Generate Application Docker Image

```shell
docker-compose build
```

## Start the P2P Network and Database

```shell
docker-compose up
```

## Verify the Database Entries

```shell
docker exec -it p2p-db psql -U p2p_user -d p2p_db -c "SELECT * FROM p2p_payloads;"
```


