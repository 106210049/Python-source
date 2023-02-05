import os

os.system('cls')
s="****1234 Hello****"
s1="python code"

# s+s1
print(s+s1)

# *
print((s+'\n')*2)

# in
print('a'in s)
print('1' in s)

# position
print(s[2])
print(s[1:8:2])

# change string
ss='world'+s[1: ]
print(ss)

# Format string
print("With %s and %s"%(s,s1))
a=5
print("%s= %d"%(s,a))
print("a={0}, b={1}, c={2}".format(s1,a,s))

# count()
print("n=",s.count('l',1,10))

# capitalize()
print("New string: ",s1.capitalize())

#upper()
print("New string:",s1.upper())

# lower()
s2="HELLO WORLD !!!"
print("New string:",s2.lower())

#title()
print("New string:",s1.title())

#lstrip()
print("New string:",s.lstrip("*"))

#strip()
print("New string:",s.strip("*"))

#split()
s3="Information Technology Falculty"
print("New string:",s3.split(" ",1))
print("New string:",s3.split(" ",2))

# join()
s4=("Information","Technology","Falculty")
print(s4)
print("New string:","-".join(s4))

#find()
print("location: ",s3.find("T",0,16))

#replace()
print("New string:",s3.replace("Information Technology","Electronic and Communicating"))