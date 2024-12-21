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
    var currentAge: Int = 0
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
        if !isTooOld {
            energy += 5
            currentAge += 1
            print("\(name) is sleeping, Energy - \(energy), Weight - \(weight), currentAge - \(currentAge)")
        } else {
            print("Животное \(name) слишком дряхлое для жизни в этом мире")
        }
        
    }
    
    func eat() {
        if !isTooOld {
            energy += 3
            weight += 1
            tryIncrementAge()
            print("\(name) is eating, Energy - \(energy), Weight - \(weight), currentAge - \(currentAge)")
        } else {
            print("Животное \(name) слишком дряхлое для жизни в этом мире")
        }
    }
    
    func move() {
        if energy >= 5 && weight >= 1 && !isTooOld {
            energy -= 5
            weight -= 1
            tryIncrementAge()
            print("\(name) is moving, Energy - \(energy), Weight - \(weight), currentAge - \(currentAge)")
        } else {
            print("Животное \(name) слишком дряхлое для жизни в этом мире")
        }
    }
    
    private func tryIncrementAge() {
        if Bool.random() {
            currentAge += 1
        }
    }
    
    func reproduce() -> Animal? {
        if energy > 0 && weight > 0 && !isTooOld {
            let babyAnimal = Animal(name: name, maxAge: maxAge, weight: Int.random(in: 1...5), energy: Int.random(in: 1...10))
            print("The Animal was born: Name - \(name), Max age - \(maxAge), weight - \(babyAnimal.weight), energy - \(babyAnimal.energy)")
            return babyAnimal
        } else {
            return nil
        }
    }
}

let myAnimal = Animal(name: "Lion Alex", maxAge: 20, weight: 1, energy: 0)
print("The Animal: Name - \(myAnimal.name), Max age - \(myAnimal.maxAge), Current age - \(myAnimal.currentAge), Energy - \(myAnimal.energy), Weight - \(myAnimal.weight)")
print(myAnimal.isTooOld)
myAnimal.sleep()
myAnimal.eat()
myAnimal.move()
let babyAnimal = myAnimal.reproduce() ?? myAnimal
print(Unmanaged.passUnretained(myAnimal).toOpaque())
print(Unmanaged.passUnretained(babyAnimal).toOpaque())
print(myAnimal === babyAnimal)

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

final class Bird: Animal {
    override func move() {
        super.move()
        if energy >= 5 && weight >= 1 && !isTooOld {
            print("\(name) is flying, energy - \(energy), weight - \(weight)")
        }
    }
    
    override func reproduce() -> Bird? {
        if energy > 0 && weight > 0 && !isTooOld {
            let babyBird = Bird(name: name, maxAge: maxAge, weight: Int.random(in: 1...5), energy: Int.random(in: 1...10))
            print("The Bird was born: Name - \(name), Max age - \(maxAge), weight - \(babyBird.weight), energy - \(babyBird.energy)")
            return babyBird
        } else {
            return nil
        }
    }
}
let myBird = Bird(name: "Chiko", maxAge: 7, weight: 2, energy: 35)
myBird.move()
let babyBird = myBird.reproduce() ?? myBird
print(Unmanaged.passUnretained(myBird).toOpaque())
print(Unmanaged.passUnretained(babyBird).toOpaque())
print(myBird === babyBird)



final class Fish: Animal {
    override func move() {
        super.move()
        if energy >= 5 && weight >= 1 && !isTooOld {
            print("\(name) is swimming, energy - \(energy), weight - \(weight)")
        }
    }
    
    override func reproduce() -> Fish? {
        if energy > 0 && weight > 0 && !isTooOld {
            let babyFish = Fish(name: name, maxAge: maxAge, weight: Int.random(in: 1...5), energy: Int.random(in: 1...10))
            print("The Fish was born: Name - \(name), Max age - \(maxAge), weight - \(babyFish.weight), energy - \(babyFish.energy)")
            return babyFish
        } else {
            return nil
        }
    }
}
let myFish = Fish(name: "Nemo", maxAge: 10, weight: 3, energy: 78)
myFish.move()
let babyFish = myFish.reproduce() ?? myFish
print(Unmanaged.passUnretained(myFish).toOpaque())
print(Unmanaged.passUnretained(babyFish).toOpaque())
print(myFish === babyFish)



final class Dog: Animal {
    override func move() {
        super.move()
        if energy >= 5 && weight >= 1 && !isTooOld {
            print("\(name) is running, energy - \(energy), weight - \(weight)")
        }
    }
    
    override func reproduce() -> Dog? {
        if energy > 0 && weight > 0 && !isTooOld {
            let babyDog = Dog(name: name, maxAge: maxAge, weight: Int.random(in: 1...5), energy: Int.random(in: 1...10))
            print("The Dog was born: Name - \(name), Max age - \(maxAge), weight - \(babyDog.weight), energy - \(babyDog.energy)")
            return babyDog
        } else {
            return nil
        }
    }
}
let myDog = Dog(name: "Barboss", maxAge: 20, weight: 13, energy: 64)
myDog.move()
let babyDog = myDog.reproduce() ?? myDog
print(Unmanaged.passUnretained(myDog).toOpaque())
print(Unmanaged.passUnretained(babyDog).toOpaque())
print(myDog === babyDog)

print("------------------------------------------------------------------")


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

class NatureReserve {
    var animals: [Animal] = []
    
    func lifeCircle(birdItteration: Int, fishItteration: Int, dogItteration: Int, circleItteration: Int) {
        for _ in 1...birdItteration {
            animals.append(Bird(name: "Bird", maxAge: 7, weight: Int.random(in: 1...5), energy: Int.random(in: 1...100)))
        }
        
        for _ in 1...fishItteration {
            animals.append(Fish(name: "Fish", maxAge: 10, weight: Int.random(in: 1...7), energy: Int.random(in: 1...100)))
        }
        
        for _ in 1...dogItteration {
            animals.append(Dog(name: "Dog", maxAge: 20, weight: Int.random(in: 1...25), energy: Int.random(in: 1...100)))
        }
        
        for _ in 1...circleItteration {
            for animal in animals {
                switch Int.random(in: 1...4) {
                case 1:
                    animal.sleep()
                case 2:
                    animal.eat()
                case 3:
                    animal.move()
                case 4:
                    let animalBaby = animal.reproduce() ?? animal
                    animals.append(animalBaby)
                default:
                    break
                }
            }
            
            print(animals.count)
            
            let youngAnimals = animals.filter { $0.currentAge < $0.maxAge }    // 1 способ
            print("В заповеднике осталось \(youngAnimals.count) животных")
            
            animals.removeAll { $0.isTooOld }                                  // 2 способ
            print("В заповеднике все еще \(animals.count) животных")
            
            if animals.isEmpty {
                print("Все животные исчезли")
            }
        }
    }
}
let lifeNatureReserve = NatureReserve()
lifeNatureReserve.lifeCircle(birdItteration: 5, fishItteration: 3, dogItteration: 2, circleItteration: 1)
