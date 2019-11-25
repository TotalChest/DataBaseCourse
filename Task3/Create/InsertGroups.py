import random

f = open('InsertGroups.csv', 'w')
for i in range(1,10001):
	f.write(str(i)+','+str(random.randint(4, 5000))+'\n')

f.close
