import dask.distributed
import dask
import dask.config
import os

client = dask.distributed.Client("tcp://172.17.0.2:8786")

def add(a, b):
    x = a + b
    return x

def alinhar():
    os.system("python3 /SPAdes-4.0.0-Linux/bin/spades.py -k 21,33 -1 R1.fq.gz -2 R2.fq.gz -o teste")
    os.system("cat teste/contigs.fasta | grep '>' -c")

local = []
#caso precise saber qual o nome da pasta temporaria de cada worker, descomentar até a linha 29
pre_dic = dict(client.scheduler_info())
print(pre_dic)
capture_ip = pre_dic['workers']
#print(capture_ip.keys())
teste = list(capture_ip.keys())
for i in teste:
    local.append(pre_dic['workers'][i]['local_directory'])
print(local)

#client.upload_file("./R1.fq.gz")
#client.upload_file("./R2.fq.gz")
exec = client.submit(alinhar)
#exec = client.submit(add, 1, 2)
print(client.gather(exec)) #captura o resultado
resultado = client.gather(exec) #captura o resultado

client.close()
