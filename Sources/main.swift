
print("Enter first number: ")
let firstNumber = readLine().flatMap { Int($0) } ?? 0 // Input: 10
print("Enter second number: ")
let secondNumber = readLine().flatMap { Int($0) } ?? 0 // Input: 5


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
let sum = calculator.calculate(operation: calculator.add, a: firstNumber, b: secondNumber)
let difference = calculator.calculate(operation: calculator.subtract, a:  firstNumber, b: secondNumber)
let product = calculator.calculate(operation: calculator.multiply, a:  firstNumber, b: secondNumber)
let quotient = calculator.calculate(operation: calculator.divide, a:  firstNumber, b: secondNumber)


// Higher-order functions: Returning functions
func getOperation(type: String) -> (Int, Int) -> Int {
    switch type {
    case "add":
        return calculator.add
    case "subtract":
        return calculator.subtract
    case "multiply":
        return calculator.multiply
    case "divide":
        return calculator.divide

    default:
        return { _, _ in 0 }
    }
}

print("Enter operation type: ")
var operationType = readLine() ?? "" // Input: add
operationType = operationType.lowercased()
let operation = getOperation(type: operationType)
let result = calculator.calculate(operation: operation, a: firstNumber, b: secondNumber)
print("Result: \(result)") // Output: Result: 15
