import Foundation

//# Задание 1
// ## Создайте класс животного Animal.
// ## У животного должны быть характеристики:
// ### энергия,
// ### вес,
// ### текущий возраст,
// ### максимальный возраст,
// ### имя.
// ## Энергия, вес, максимальный возраст и имя должны инициализироваться через конструктор.
// ## Добавьте вычисляемое свойство isTooOld — Boolean.
// ### Оно должно сравнивать текущий возраст с максимальным и возвращать true, если текущий возраст равен или больше максимального.
// ## Животное может спать, питаться и передвигаться.
// ## Во время сна:
// ### Энергия животного увеличивается на 5, а возраст — на 1.
// ### В консоль выводится сообщение: «${имя животного} спит».
// ## Во время питания:
// ### Энергия животного увеличивается на 3, а вес — на 1.
// ### Возраст животного может увеличиться на 1.
// ### В консоль выводится сообщение: «${имя животного} ест».
// ## Во время передвижения:
// ### Энергия животного уменьшается на 5, а вес — на 1.
// ### Возраст животного может увеличиться на 1.
// ### В консоль выводится сообщение: «${имя животного} передвигается».
// ## Случайное увеличение возраста реализуйте с помощью класса Bool и его метода random()
//
//if (Bool.random()) {
// //увеличить возраст
//}
//
// ## Вынесите случайное увеличение возраста в метод — tryIncrementAge
// ## Если животное слишком старое, если не хватает веса или энергии для совершения действия, то ничего не происходит.
// ## Животное может производить потомство.
// ### Имя и максимальный возраст у рождённого животного такие же, как и у родителя.
// ### Энергия для рождённого животного устанавливается случайно в диапазоне от 1 до 10.
// ### Вес для рождённого животного устанавливается случайно в диапазоне от 1 до 5.
// ### В консоль должно выводиться сообщение о том, какое животное было рождено и какие у него характеристики.

class Animal {
    let name: String
    var currentAge: Int = 5
    let maxAge: Int
    var weight: Int
    var energy: Int
    
    var isTooOld: Bool {
        currentAge >= maxAge
    }
    
    init(name: String, maxAge: Int, weight: Int, energy: Int) {
        self.name = name
        self.maxAge = maxAge
        self.weight = weight
        self.energy = energy
    }
    
    func sleep() {
        self.energy += 5
        self.currentAge += 1
        print("\(self.name) is sleeping, Energy - \(self.energy), Weight - \(self.weight), currentAge - \(self.currentAge)")
    }
    
    func eat() {
        self.energy += 3
        self.weight += 1
        tryIncrementAge()
        print("\(self.name) is eating, Energy - \(self.energy), Weight - \(self.weight), currentAge - \(self.currentAge)")
    }
    
    func move() {
        self.energy -= 5
        self.weight -= 1
        tryIncrementAge()
        print("\(self.name) is moving, Energy - \(self.energy), Weight - \(self.weight), currentAge - \(self.currentAge)")
    }
    
    private func tryIncrementAge() {
        if Bool.random() {
            self.currentAge += 1
        }
    }
    
    func reproduce() -> Animal {
        if Bool.random() {
            self.energy = Int.random(in: 1...10)
            self.weight = Int.random(in: 1...5)
            print("The Animal was born: Name - \(self.name), Max age - \(self.maxAge), Energy - \(self.energy), Weight - \(self.weight)")
        } else {
            print("There is no new Animal")
        }
        return self
    }
}

let myAnimal = Animal(name: "Lion Alex", maxAge: 20, weight: 200, energy: 85)
print("The Animal: Name - \(myAnimal.name), Max age - \(myAnimal.maxAge), Current age - \(myAnimal.currentAge), Energy - \(myAnimal.energy), Weight - \(myAnimal.weight)")
print(myAnimal.isTooOld)
myAnimal.eat()
myAnimal.move()
myAnimal.sleep()
myAnimal.reproduce()

myAnimal.currentAge = 20
print(myAnimal.isTooOld)

print("---------------------------------")


//# Задание 2
//## Создайте наследников класса Animal: Bird, Fish, Dog.
//## В каждом из наследников переопределите функцию, отвечающую за передвижение. Для каждого наследника в этой функции необходимо вызвать родительскую реализацию и дополнительно вывести в консоль сообщение:
//### энергия,
//### вес,
//
// для Bird — «летит»,
// для Fish — «плывет»,
// для Dog — «бежит».
//
// ## По желанию: добейтесь, чтобы дополнительное сообщение выводилось только если выполнилась родительская реализация.
// ## В каждом из наследников переопределите функцию, отвечающую за рождение потомка. Класс Fish должен возвращать объект класса Fish. Аналогично с Bird и Dog.

class Bird: Animal {
    override func move() {
        super.move()
        print("\(self.name) is flying, energy - \(self.energy), weight - \(self.weight)")
    }
    
    override func reproduce() -> Bird {
        super.reproduce()
        return self
    }
}
let myBird = Bird(name: "Chiko", maxAge: 7, weight: 2, energy: 35)
print(myBird.move())
print(myBird.reproduce())



class Fish: Animal {
    override func move() {
        super.move()
        print("\(self.name) is swimming, energy - \(self.energy), weight - \(self.weight)")
    }
    
    override func reproduce() -> Fish {
        super.reproduce()
        return self
    }
}
let myFish = Fish(name: "Nemo", maxAge: 10, weight: 3, energy: 78)
print(myFish.move())
print(myFish.reproduce())



class Dog: Animal {
    override func move() {
        super.move()
        print("\(self.name) is running, energy - \(self.energy), weight - \(self.weight)")
    }
    
    override func reproduce() -> Dog {
        super.reproduce()
        return self
    }
}
let myDog = Dog(name: "Barboss", maxAge: 20, weight: 13, energy: 64)
print(myDog.move())
print(myDog.reproduce())

print("---------------------------------")


//# Задание 3
//## Создайте класс NatureReserve, который представляет из себя заповедник с разными животными.
//## Инициализируйте заповедник. Изначально в нём должно быть пять птиц, три рыбы, две собаки и несколько обычных животных.
//### По желанию: создайте дополнительные виды животных и добавьте их в заповедник.
//## Напишите программу, которая имитирует жизненный цикл животных в заповеднике.
//### В течение ограниченного числа итераций N каждое животное делает одно случайное действие, которое позволяют сделать его свойства: ест, спит, двигается, рожает.
// ### Когда у животного рождается детёныш, он добавляется к общему количеству животных заповедника.
// ### В конце итерации все животные, у которых возраст превысил максимальный, удаляются из заповедника.
// ### По окончании работы должно выводиться число животных в заповеднике, которые остались живы.
// ### Если все животные исчезли — программа должна прерываться, с выводом соответствующего сообщения.
