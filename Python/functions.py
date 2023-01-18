# Decorator is a function that takes another function name as an argument
# It has an inner function which collects the arguments that are passed to the source function
import time

def calc_time(func):  # func=square_nums
    def wrapper(*x,**y):  # *x=nums, **y={}
        start=time.time()
        res=func(*x,**y)
        end=time.time()
        print(func.__name__ + ' function took: '+ str((end-start)*1000)+' milli seconds')
        return res
    return wrapper

@calc_time
def square_nums(nums):
    result=[]
    for x in nums:
        result.append(x*x)
    return result

@calc_time
def cube_nums(nums):
    result=[]
    for x in nums:
        result.append(x * x*x)
    return result

data=list(range(1,1000001))
square_nums(data)
cube_nums(data)