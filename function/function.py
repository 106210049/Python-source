def cheese_and_crackers (cheese_count , boxes_of_crackers):
    print("You have %d cheese!" %cheese_count)
    print("You have %d boxes of crackers!" %boxes_of_crackers)
    print("Man that's enough for party!")
    print("Get a blanket.\n")

print("We can just give the function number directly:")
cheese_and_crackers(20 , 30)

print("Oh, we can use variables from out scripts:")
amount_of_cheese = 10
amount_of_crakers = 50

cheese_and_crackers(amount_of_cheese , amount_of_crakers)

print("We can even do math inside too:")
cheese_and_crackers(10 + 20 , 5 + 6)

print("We can combine the two, variables and math:")
cheese_and_crackers(amount_of_cheese + 100 , amount_of_crakers + 10000) 

def sum(a,b):
    print(a+b)
sum(2,3)