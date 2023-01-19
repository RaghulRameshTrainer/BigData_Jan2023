class Employee:
    # hike=1.05
    def __init__(self,fname,lname,salary):
        self.fname=fname
        self.lname=lname
        self.pay=salary
        self.email=self.fname+'_'+self.lname+'@outlook.com'

    def fullname(self):
        return f'{self.fname} {self.lname}'

    def appraisal(self,hike):
        self.hike=hike
        self.pay=int(self.pay*self.hike)

    @classmethod
    def create_object(cls,str):
        fn,ln,sl=str.split("-")
        return cls(fn,ln,int(sl))

    @staticmethod
    def is_workingday(dt):
        if dt.weekday()==5 or dt.weekday()==6:
            return "HOLIDAY!!!"
        else:
            return "WorkingDay!"


class Developer(Employee):
    def __init__(self,fname,lname,salary,tech):
        self.tech=tech
        super().__init__(fname,lname,salary)

    # def fullname(self,title):
    #     return f'{title} {self.fname}{self.lname}'
    #
    # def fullname(self,title,designation):
    #     return f'{title} {self.fname}{self.lname} - {designation}'

    def fullname(self,*info):
        if len(info)==1:
            return f'{info[0]} {self.fname}{self.lname}'
        return f'{info[0]} {self.fname}{self.lname} - {info[1]}'

dev_1=Developer('Mohan','Kumar',10000,'Bigdata')

print(dev_1.fullname('Mr'))











# str1="Malini-Sekar-100000"
# str2="Ashwin-Kumar-200000"
#
# emp1=Employee.create_object(str1)
# emp2=Employee.create_object(str2)
# # emp1=Employee('Levin','Lenus',50000)
# # emp2=Employee('Siva','Murgan',60000)
#
# import datetime
# tday=datetime.date(2023,1,23)
# print(Employee.is_workingday(tday))
# # print(emp1.fullname())
# # print(emp2.fullname())

# emp1.hike=1.1
# print(emp1.pay)
# emp1.appraisal(1.1)
# print(emp1.pay)
#
# print(emp2.pay)
# emp2.appraisal(1.2)
# print(emp2.pay)