from sys import exit
def fibonacci():
    x,y=1,1
    while True:
        yield x
        x,y=y,x+y

for x in fibonacci():
    if x>100:
        exit(0)
    print(x,end=" ")


#1,1,2,3,5,8,13,21,34,55.....