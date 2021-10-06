import pymysql

user = input("Enter user name: ")
passwd = input("Enter passwd: ")
conn = pymysql.connect(host='13.125.238.168', user=user, password=passwd, db='jjikmeok', charset='utf8')
cursor = conn.cursor()

cursor.execute('SELECT * FROM user')
res = cursor.fetchall()

for data in res:
    print(data)
    
