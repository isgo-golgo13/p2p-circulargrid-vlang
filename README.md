# P2P Node Connector Grid using V
P2P Node Connector Grid as a CircularList using V Language


## Project Architecture
Develop a circular linked list in V where each linked list node acts a P2P socket node with bidirectional connections to its adjacents. This design assures that each node:

- Sustains forward and reverse connections to its adjacents.
- Talks using (UDP, TCP) sockets 
- Creates a self-healing network if nodes leave or join

### Workflow Apporoach

- Each P2P linked list node will have:
    - A unique identifier (ID)
    - A socket connection (TCP)
    - Pointers to the previous and next P2P linked list node
- P2P nodes talk TCP for guaranteed delivery and UDP (for low-latency) exchanges.
- If a P2P node leaves, the network updates the links dynamically


## Project Structure

```shell
README.md
├── p2p_circulargrid
│   ├── Dockerfile
│   ├── docker-compose.yaml
│   ├── src
│   │   ├── db
│   │   │   ├── db_dao.v       # Handles database interactions
│   │   │   ├── db_data.v      # Defines database models
│   │   ├── main.v             # Entry point
│   │   ├── node.v             # P2P Node logic (TCP Sockets)
│   │   ├── network.v          # Manages connections between nodes
│   │   ├── node_payload.v     # Handles message structure & parsing
│   └── v.mod
└── sql
    └── schema.sql             # Database schema
```



## Installing V Third-Party Dependencies

```shell
v install username/package_name
```

## Updating V Third-Party Dependencies

```shell
v update
```




## Compile the Application
```shell
v -prod -o bin/p2p-node src/main.v
```

## Run the Application
```shell
./bin/p2p-node --port 8080 --bootstrap-node "192.168.1.10:8080"
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


