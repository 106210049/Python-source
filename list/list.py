# list
a=[1,2,3,4,5]
print("list a=",a)

# 
lst=[n for n in range(1,5)]
print("list=",lst)

lst2=[x for x in range(0,10) if x%2==0 and x!=6]
print("list 2=",lst2)

lst3=list([1,2,3,'a'])
print("list 3=",lst3)

print("a[1]=",a[1])
print("a[2:4]=",a[2:4])

# add item
a.append(0)
print("new list= ",a)
a.insert(2,7)
print("new list= ",a)

# delete item at location
a.__delitem__(3) #xóa số vị trí số 3
print("new list=",a)

a.remove(0) # xóa giá trị 0
print("new list=",a)

for i in a:
    print(i)

for i,xi in enumerate(a):
    print("i=",i, "xi=",xi)

# len(<list>)
print("length=",len(a))

#sum(<list>)
print("sum=",sum(a))

#sorted(<list>)
print("new list",sorted(a))

#sorted(list,reverse=True)
print("new list=",sorted(a,reverse=True))

#max(<list>)
print("max=",max(a))

#min(<list>)
print("min=",min(a))