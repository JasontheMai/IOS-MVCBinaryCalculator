//
//  TabbedCalc01Model.swift
//  TabbedCalc01
//
//  Created by Jason Mai on 1/21/23.
//

import Foundation

class Calc01Model{
    //right version for git
    
    var memory: String = ""
    var historyTime = false
    
    var firstOperand:String
    var secondOperand:String
    var operation:String
    var oldMemory:String
    var memorySign:String
    var newMemory: String
    var solution: String
    
    init(firstOperand: String, secondOperand: String, operation: String, oldMemory:String, memorySign:String, newMemory: String, solution: String) {
        self.firstOperand = firstOperand
        self.secondOperand = secondOperand
        self.operation = operation
        self.oldMemory = oldMemory
        self.memorySign = memorySign
        self.newMemory = newMemory
        self.solution = solution
    }
    
    func setFirstOperand(_ num: String){
        firstOperand = num
    }
    func setScondOperand(_ num: String){
        secondOperand = num
    }
    func setOperation(_ operationSign: String){
        operation = operationSign
    }
    
    func memoryOperations() -> String {
        var binaryMemory1 = binaryToDecimal(oldMemory)
        var binaryMemory2 = binaryToDecimal(newMemory)
        
        
        if(memorySign == "M+"){
            
            
            memory.append(String(decimalToBinary(binaryMemory1)))
            memory.append("+")
            memory.append(String(decimalToBinary(binaryMemory2)))
            memory.append(" = ")

        }
        
        if(memorySign == "M-"){
            memory.append(String(decimalToBinary(binaryMemory1)))
            memory.append("-")
            memory.append(String(decimalToBinary(binaryMemory2)))
            memory.append(" = ")

        }

        
        if(memorySign == "M+"){
            
            solution = decimalToBinary(binaryMemory1 + binaryMemory2)
            memory.append(solution)
            memory.append("\n")

            historyTime = true
            return decimalToBinary(binaryMemory1 + binaryMemory2)
        }
        else if(memorySign == "M-"){
            
            solution = decimalToBinary(binaryMemory1 - binaryMemory2)
            memory.append(solution)
            memory.append("\n")

            historyTime = true
            return decimalToBinary(binaryMemory1 - binaryMemory2)
        }
        else {
            return "Memory Error"
        }
    }
    
    func performOperation() -> String{
        memory.append(firstOperand)
        memory.append(operation)
        memory.append(secondOperand)
        memory.append(" = ")
        
        if(operation == "-"){
            solution = decimalToBinary(binaryToDecimal(self.firstOperand) - binaryToDecimal(self.secondOperand))
            memory.append(solution)
            memory.append("\n")

            historyTime = true
            return decimalToBinary(binaryToDecimal(self.firstOperand) - binaryToDecimal(self.secondOperand))
        }
        else if(operation == "+"){
            solution = decimalToBinary(binaryToDecimal(self.firstOperand) + binaryToDecimal(self.secondOperand))
            memory.append(solution)
            memory.append("\n")

            historyTime = true
            return decimalToBinary(binaryToDecimal(self.firstOperand) + binaryToDecimal(self.secondOperand))
        }
        else if(operation == "x"){
            solution = decimalToBinary(binaryToDecimal(self.firstOperand) * binaryToDecimal(self.secondOperand))
            memory.append(solution)
            memory.append("\n")

            historyTime = true
            return decimalToBinary(binaryToDecimal(self.firstOperand) * binaryToDecimal(self.secondOperand))
        }
        else if(operation == "/"){
            if(binaryToDecimal(self.secondOperand) == 0){
//                print("second operand is")
//                print(secondOperand)
//                print("Decimal of second operand is")
//                print(binaryToDecimal(self.secondOperand))
                return "Cannot divide by 0"
            }
            else{
                
                
                solution = decimalToBinary(binaryToDecimal(self.firstOperand) / binaryToDecimal(self.secondOperand))
                memory.append(solution)
                memory.append("\n")

                historyTime = true
                return decimalToBinary(binaryToDecimal(self.firstOperand) / binaryToDecimal(self.secondOperand))
            }
        }
        else{
            //Should never reach this more for debugging than anything
            print("fail in perorm operation")
            return "Don't do that"
        }
        
    }
    
    func binaryToDecimal(_ binary: String) -> Int{
        return Int(binary, radix:2) ?? 0
    }
        //converts the calculated decimal numbers into binary
    func decimalToBinary(_ decimal: Int) -> String {
        return String(decimal, radix:2) ?? "0"
    }
}
