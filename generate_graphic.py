import json
import matplotlib.pyplot as plt 

with open('data.json') as json_file:
    data = json.load(json_file)

data_len = len(data)
len = [i for i in range(data_len)]
cpu = [data[str(i)][0] for i in range(data_len)]
mem = [data[str(i)][1] for i in range(data_len)]
plt.plot(len, cpu, label = "CPU") 
plt.plot(len, mem, label = "Memory") 
plt.xlabel('Time') 
plt.ylabel('Percentage') 
plt.title('CPU & Memory Usage') 
plt.legend() 
plt.show() 