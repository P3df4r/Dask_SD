import dask.distributed
import dask
from Bio.Align.Applications import ClustalwCommandline
import tempfile

client = dask.distributed.Client("tcp://192.168.0.209:8786")

def add(a, b):
    x = a + b
    return x

def alinhar(dic):
    print(tempfile.gettempdir())
    fasta = open("{}/genomes.fasta".format(dic), "r")
    print(fasta.read())
    ClustalwCommandline('clustalw2', infile='', outfile="{}/genomes.fasta".format(dic), type='dna')()
    pre_result = open("{}/genomes.fasta".format(dic), "r")
    result = pre_result.read()
    return result


file_user = open("./teste.fasta", "r") 
file_db = open("./sequence.fasta", "r")
new_file = open("./genomes.fasta", "w")
new_file.write(file_user.read() + "\n" + file_db.read())
loc = client.upload_file("./genomes.fasta")
pre_dic = dict(client.scheduler_info())
print(pre_dic)




dic = pre_dic['workers']['tcp://172.17.0.2:38801']['local_directory']
exec = client.submit(alinhar, dic)
#print(exec) #exec guarda o objecto com a função que está sendo executada no worker

print(client.gather(exec)) #captura o resultado
#resultado = client.gather(exec) #captura o resultado
#local_result = open("result.fasta", "w")
#local_result.write(resultado)

client.close()
