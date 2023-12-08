// The Swift Programming Language
// https://docs.swift.org/swift-book


// OOP: Creating a class
class Calculator {
    // First-class functions: Defining functions as properties
    var add: (Int, Int) -> Int
    var subtract: (Int, Int) -> Int
    var multiply: (Int, Int) -> Int
    var divide: (Int, Int) -> Int
    
    init() {
        // Closures: Assigning closures to function properties
        add = { (a, b) in
            return a + b
        }
        
        subtract = { (a, b) in
            return a - b
        }

        multiply = { (a, b) in
            return a * b
        }

        divide = { (a, b) in
            return a / b
        }
    }
    
    // Higher-order functions: Accepting functions as parameters
    func calculate(operation: (Int, Int) -> Int, a: Int, b: Int) -> Int {
        return operation(a, b)
    }
}

// Creating an instance of the Calculator class
let calculator = Calculator()

// Using the first-class functions and closures
let number1 = 10
let number2 = 5

let sum = calculator.calculate(operation: calculator.add, a: number1, b: number2)
let difference = calculator.calculate(operation: calculator.subtract, a:  number1, b: number2)
let product = calculator.calculate(operation: calculator.multiply, a:  number1, b: number2)
let quotient = calculator.calculate(operation: calculator.divide, a:  number1, b: number2)

print("Sum: \(sum)") // Output: Sum: 8
print("Difference: \(difference)") // Output: Difference: 3
print("Product: \(product)") // Output: Product: 50
print("Quotient: \(quotient)") // Output: Quotient: 2
