import UIKit

let double = Double.random(in: -1.2...4.5)
let integer = Int.random(in: .min ... .max)
let unsignedInteger = UInt.random(in: 4...9)
let bool = Bool.random()

var generator = SystemRandomNumberGenerator()
let double2 = Double.random(in: 1.0..<4.2, using: &generator)

let array = ["Cat", "Cow", "Dog", "Sheep"]
if let element = array.randomElement() {
    print(element) // e.g Dog
}

let shuffled = array.shuffled()
print(array, shuffled) // e.g ["Cat", "Cow", "Dog", "Sheep"] ["Dog", "Cow", "Sheep", "Cat"]

struct SeededRandomNumberGenerator: RandomNumberGenerator {
    init(seed: Int) {
        srand48(seed)
    }
    
    func next() -> UInt64 {
        return UInt64(drand48() * Double(UInt64.max))
    }
}

var seededGenerator = SeededRandomNumberGenerator(seed: 5)
let random = Int.random(in: -5...5, using: &seededGenerator)
print(random)
