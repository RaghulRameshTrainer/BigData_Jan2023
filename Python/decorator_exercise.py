#from sys import exit

def check_value(fn):
    def inner(x,y):
        if y==0:
            print("can't divide a value by 0")
            #exit(0)
        else:
            res=fn(x,y)
            print(res)
    return inner

@check_value
def divide(x,y):
    return x/y

#divide(10,5)
divide(5,0)