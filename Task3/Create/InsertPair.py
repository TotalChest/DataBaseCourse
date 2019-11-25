import random
time = ['8:45','10:30','12:50','14:35','16:20','18:05']
subject = ['Математический анализ','Линейная алгебра','Базы данных','Операционые системы','Программирование','Физическая культура','Физика','Русский язык','Численные методы','Аналитическая геометрия']

def university(i):
	if (i<16):
		return 'МГУ'
	if (i<31):
		return 'МГТУ'
	if (i<38):
		return 'Синергия'
	if (i<51):
		return 'ВШЭ'
	if (i<67):
		return 'МФТИ'
	if (i<80):
		return 'МИФИ'
	if (i<86):
		return 'МТУ'
	if (i<91):
		return 'МГЛУ'
	if (i<97):
		return 'МАИ'
	if (i<101):
		return 'РГГУ'
 
p = open('InsertPair.sql', 'w')
p.write('BEGIN;\n')
for i in range(1,10000001):

	if (i%100000 == 0):
		print(int(i/100000))

	uni = random.randint(1,100)
	sub = random.randint(1, 10)
	teach = random.randint(1, 1000000)
	clas = random.randint(1, 1000000)
	gr = random.randint(1, 10000)
	tm = random.randint(0,5)
	wd = random.randint(1,6)
	year = random.randint(1,6)

	p.write('INSERT INTO pair values (default,\''+university(uni)+'\','+str(sub)+',\''+subject[sub-1]+'\','+str(teach)+','+str(clas)+','+str(gr)+',\''+time[tm]+'\','+str(wd)+','+str(year)+');\n')
	
p.write('COMMIT;\n')
p.close
