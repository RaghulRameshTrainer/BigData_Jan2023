from abc import ABC , abstractmethod
class Car(ABC):
    @abstractmethod
    def engine(self):
        pass
    @abstractmethod
    def seats(self):
        pass
    @abstractmethod
    def breaks(self):
        pass
    @abstractmethod
    def mirror(self):
        pass
    def price(self,model):
        if model=='EcoSport':
            print("1800000")
        elif model=="Fiesta":
            print("1500000")
        elif model=="Figo":
            print("1000000")
        else:
            print("Please check at showroom")

class NewCar(Car):
    def engine(self):
        self.type="powerstrain"

    def seats(self):
        self.capacity="6 seater"

    def breaks(self):
        self.breaks_fittings="Done"

    def mirror(self):
        self.count=2

    def loan_details(self):
        print("We offer loan for all salaried people!")

c1=NewCar()
c1.price("ASPIRE")
c1.loan_details()