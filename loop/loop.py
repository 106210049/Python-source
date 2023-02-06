# while:
i=0
while i<10:
    print(i)
    i+=1

# for
for i in range(1,6,2):
    print(i)

fruits=["apple","banana","cherry"]
for i in fruits:
    print(i)

# exercise 1:
n=int(input("Nhap n: "))
sum=0
for i in range(1,n,2):
    if i%2!=0:
        sum=sum+i
    print("Sum=",sum)

#exercise 2:
n=int(input("Nhap n: "))
sum=0

