class Account():
    def __init__(self,name,deposit,pan):
        self.name=name
        self.__balance=deposit #(public,_=>protected, __=>private)
        self.pan_number=pan
        self.userid=self.name+pan[-4:]
        self.passwd=pan[::-1]

    def getBalance(self):
        return self.__balance

    def setBalance(self,amt):
        self.__balance=self.__balance+amt
