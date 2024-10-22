docker run -d -i -p 8786 --name server ubuntu
docker run -d -i -p 8786 --name worker1 ubuntu
docker run -d -i -p 8786 --name worker2 ubuntu
docker run -d -i -p 8786 --name worker3 ubuntu

docker start server
docker inspect server | grep 'IPAdress'
echo digite o ip do container
read ip
docker cp run_server.sh server:/.
docker cp dask_test.py server:/.
docker exec -d server bash run_server.sh

docker start worker1
docker cp run_worker.sh worker1:/.
docker exec -d worker1 bash run_worker.sh $ip

docker start worker2
docker cp run_worker.sh worker2:/.
docker exec -d worker1 bash run_worker.sh $ip

docker start worker3
docker cp run_worker.sh worker3:/.
docker exec -d worker1 bash run_worker.sh $ip

sleep 600

docker exec server python3 dask_test.py
sleep 600
docker exec server head -10 test/
