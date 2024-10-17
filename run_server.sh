#favor inserir seu ip quando for rodar esse script
apt update
apt upgrade
apt install python3
apt install python3-pip
apt install docker
docker pull ubuntu:latest
pip install "dask[distributed]"
apt install python3-dask
wget https://github.com/tseemann/shovill/blob/master/test/R1.fq.gz
wget https://github.com/tseemann/shovill/blob/master/test/R2.fq.gz
tar -xvzf SPAdes-4.0.0-Linux.tar.gz
docker run -d -i -p 8786 -v $(pwd)/run_worker.sh:/home/ubuntu/. --name worker1 ubuntu
docker run -d -i -p 8786 -v $(pwd)/run_worker.sh:/home/ubuntu/.--name worker2 ubuntu
docker run -d -i -p 8786 -v $(pwd)/run_worker.sh:/home/ubuntu/.--name worker3 ubuntu
dask scheduler
docker start worker1
docker cp run_worker.sh worker1:/.
docker exec -d worker1 run_worker.sh $1
docker start worker2
docker cp run_worker.sh worker2:/.
docker exec -d worker2 run_worker.sh $1
docker start worker3
docker cp run_worker.sh worker3:/.
docker exec -d worker3 run_worker.sh $1
