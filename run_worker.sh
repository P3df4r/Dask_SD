apt update -y
apt upgrade -y
apt install python3 -y
apt install python3-pip -y
apt install tar -y
apt install python3-dask
apt install python3-distributed
wget https://github.com/ablab/spades/releases/download/v4.0.0/SPAdes-4.0.0-Linux.tar.gz
tar -xvzf SPAdes-4.0.0-Linux.tar.gz
alias spades="python3 SPAdes-4.0.0-Linux/bin/spades.py"
wget https://github.com/tseemann/shovill/blob/master/test/R1.fq.gz
wget https://github.com/tseemann/shovill/blob/master/test/R2.fq.gz
dask worker tcp://$1:8786 
