dnf update -y
dnf install python3 -y
dnf install tar -y
dnf install python3-dask.noarch -y
dnf install python3-dask+distributed.noarch -y
dnf install wget -y
wget https://github.com/ablab/spades/releases/download/v4.0.0/SPAdes-4.0.0-Linux.tar.gz
tar -xvzf SPAdes-4.0.0-Linux.tar.gz
alias spades="python3 SPAdes-4.0.0-Linux/bin/spades.py"
dask worker tcp://$1:8786 
