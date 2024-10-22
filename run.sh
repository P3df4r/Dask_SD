docker run -d -i -p 8786 --name server ubuntu
docker run -d -i -p 8786 --name worker1 ubuntu
docker run -d -i -p 8786 --name worker2 ubuntu
docker run -d -i -p 8786 --name worker3 ubuntu
ddocker start server
docker cp run_server.sh server:/.
docker exec -d server bash run_server.sh
ocker start worker1
docker cp run_worker.sh worker1:/.
docker exec -d worker1 bash run_worker $1
docker start worker2
docker cp run_worker.sh worker2:/.
docker exec -d worker1 bash run_worker $1
docker start worker3
docker cp run_worker.sh worker3:/.
docker exec -d worker1 bash run_worker $1
