docker network create --attachable --driver overlay fabric

./bymn.sh generate crypto-config.yaml

USER=kp
SERVER_HOST_1=worker1
SERVER_HOST_2=worker2
PROJECT_PATH=~/blockchain-project/fabric-multi-network

scp -r bymn.sh crypto-config channel-artifacts docker-compose-org1.yaml $USER@$SERVER_HOST_1:$PROJECT_PATH
scp -r bymn.sh crypto-config channel-artifacts docker-compose-org2.yaml $USER@$SERVER_HOST_2:$PROJECT_PATH

yes | ./bymn.sh down && yes | docker volume prune


yes | ./byfn.sh down && yes | docker volume prune