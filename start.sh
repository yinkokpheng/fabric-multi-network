./bymn.sh generate crypto-config.yaml

scp -r crypto-config channel-artifacts docker-compose-org1.yaml kp@worker1:~/blockchain-project/fabric-multi-network
scp -r crypto-config channel-artifacts docker-compose-org2.yaml kp@worker2:~/blockchain-project/fabric-multi-network

scp -r bymn.sh kp@worker1:~/blockchain-project/fabric-multi-network
scp -r bymn.sh kp@worker2:~/blockchain-project/fabric-multi-network

docker network create --attachable --driver overlay fabric


yes | ./bymn.sh down && yes | docker volume prune