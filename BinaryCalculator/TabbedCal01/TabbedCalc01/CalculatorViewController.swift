//
//  CalculatorCalculatorViewController.swift
//  TabbedCalc01
//
//  Created by Jason Mai on 1/21/23.
//

import UIKit

//maybe needs to be UIViewCOntroller
class CalculatorViewController: UIViewController {
    
    
    
    var appDelegate: AppDelegate?
    var theModel: Calc01Model = Calc01Model(firstOperand: "", secondOperand: "", operation: "", oldMemory: "", memorySign: "", newMemory: "", solution: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        if let theModelRef = self.appDelegate?.theModel{
            self.theModel = theModelRef
        }
        
    }
    
    
    
    var hasSolution = false
    var equals = false
    var firstOp = true
    
    var firstOperand: String = ""
    var secondOperand: String = ""
    var currentOperation: String = ""
    var binaryNumberEntered: Bool = false
    
    var firstPress: Bool = true
    var memorySign = ""
    var solved: Bool = false
    var solutionToMemory = ""
    var temp = ""
    var swap = false
    var hitNegative = false
    var solvedOnce = false
    
    var counter = false
    
    
    func resetCalculator(){
        counter = false
        firstOp = true
        firstOperand = ""
        secondOperand = ""
        currentOperation = ""
        binaryNumberEntered = false
        theModel.firstOperand = ""
        theModel.secondOperand = ""
        theModel.operation = ""
        calc01Display.text = ""
        solved = false
        solutionToMemory = ""
        swap = false
        hitNegative = false
    }
    
    
    @IBOutlet weak var calc01Display: UILabel!
    @IBAction func pressed01Digit(_ sender: UIButton){
        if let button = sender as? UIButton{
            if(binaryNumberEntered){
                if(firstPress){
                    firstPress = false
                    calc01Display.text = ""
                }
                if(button.titleLabel?.text == "0"){
                    secondOperand += "0"
                }
                else{
                    secondOperand += "1"
                }
                self.calc01Display.text = secondOperand
                theModel.secondOperand = secondOperand
            }
            else{
                if(firstPress){
                    calc01Display.text = ""
                    firstPress = false
                    //remove resetCalculator?
                }
                if(button.titleLabel?.text == "0"){
                    firstOperand += "0"
                }
                else{
                    firstOperand += "1"
                }
                self.calc01Display.text = firstOperand
                
                //}
            }
        }
    }
    
    //makes sure 2nd operand has 2nd opeand
    
    @IBAction func selectedOperation(_ sender: UIButton){
        if let button = sender as? UIButton{
            if(button.titleLabel?.text == "AC"){
                resetCalculator()
                
            }
            else if(button.titleLabel?.text == "+/-"){
//                hitNegative = true
//                if(counter){
//                    if(firstOp){
//                        if(firstOperand.contains("-")){
//                            firstOperand.remove(at: firstOperand.startIndex)
//                        }
//                        else{
//                            firstOperand = "-" + firstOperand
//                        }
//                        calc01Display.text = firstOperand
//                        theModel.firstOperand = firstOperand
//                    }
//                    else{
//                        if(secondOperand.contains("-")){
//                            secondOperand.remove(at: secondOperand.startIndex)
//                        }
//                        else {
//                            secondOperand = "-" + secondOperand
//                        }
//                        calc01Display.text = secondOperand
//                        theModel.secondOperand = secondOperand
//                    }
//                }
//                else{
                    if(binaryNumberEntered){
                        if(secondOperand.contains("-")){
                            secondOperand.remove(at: secondOperand.startIndex)
                        }
                        else {
                            secondOperand = "-" + secondOperand
                        }
                        calc01Display.text = secondOperand
                        theModel.secondOperand = secondOperand
                    }
                    else{
                        if(firstOperand.contains("-")){
                            firstOperand.remove(at: firstOperand.startIndex)
                        }
                        else{
                            firstOperand = "-" + firstOperand
                        }
                        calc01Display.text = firstOperand
                        theModel.firstOperand = firstOperand
                    }
                }
//            }
            
            else if(button.titleLabel?.text == "MC"){
                theModel.memorySign = ""
                theModel.oldMemory = ""
                theModel.newMemory = ""
                solutionToMemory = ""

            }
            else if(button.titleLabel?.text == "MR"){
                if(binaryNumberEntered){
                    firstOperand = theModel.oldMemory
                    calc01Display.text = firstOperand

                }
                else{
                    secondOperand = theModel.oldMemory
                    calc01Display.text = secondOperand

                
                }
            }
            else if(button.titleLabel?.text == "M+"){
//                if(solved){
//                    theModel.newMemory = theModel.solution
//                    }
//                if(binaryNumberEntered){
//                    theModel.newMemory = secondOperand
//                    }
//                else{
//                    theModel.newMemory = firstOperand
//
//                    }
                
                
                theModel.newMemory = calc01Display.text!
                
                memorySign = "M+"
                theModel.memorySign = "M+"
                solutionToMemory = theModel.memoryOperations()
                calc01Display.text = solutionToMemory
                theModel.oldMemory = solutionToMemory
                firstOperand = solutionToMemory
                theModel.firstOperand = firstOperand
                
            }
            else if(button.titleLabel?.text == "M-"){
//                if(solved){
//                    theModel.newMemory = theModel.solution
//                }
//                else if(binaryNumberEntered){
//                    theModel.newMemory = secondOperand
//                }
//                else{
//                    theModel.newMemory = firstOperand
//                }
                
                theModel.newMemory = calc01Display.text!

                memorySign = "M-"
                theModel.memorySign = "M-"
                solutionToMemory = theModel.memoryOperations()
                calc01Display.text = solutionToMemory
                theModel.oldMemory = solutionToMemory
                
                secondOperand = solutionToMemory
                theModel.secondOperand = secondOperand
            }
            
            else if(binaryNumberEntered){
                
                
                //                if(theModel.operation == "/" && theModel.secondOperand == "0"){
                //                    theModel.secondOperand = "1"
                //                }
                
//                if(!hitNegative){
                    //incase they wanted to do three inputs ie 1+1+1
                    print(theModel.firstOperand)
                    print(theModel.operation)
                    print("the second operand is")
                    print(theModel.secondOperand)
                    counter = true
                    
                    if(firstOp){
                        firstOp = false
                    }
                    else{
                        firstOp = true
                    }
                    
                    
                    if(theModel.secondOperand != ""){
                        calc01Display.text = theModel.performOperation()
                        equals = false
                    }
                    
                    //                calc01Display.text = theModel.performOperation()
                    //                if(!equals){
                    //                    calc01Display.text = theModel.performOperation()
                    //                    equals = false
                    //                }
                    //                if(theModel.operation != "="){
                    //                    calc01Display.text = theModel.performOperation()
                    //                }
                    print("the first operand is")
                    print(theModel.firstOperand)
                    print(theModel.operation)
                    print("the second operand is")
                    print(theModel.secondOperand)
                    print("the solution is")
                    
                    print(theModel.solution)
                    print("End of equation")
                    
                    hitNegative = true
                    
                    theModel.firstOperand = theModel.solution
                    theModel.secondOperand = ""
                    secondOperand = ""
               // }
                
                hitNegative = false
                    if(button.titleLabel?.text == "+"){
                        theModel.operation = "+"
                        currentOperation = "+"
                    }
                    if(button.titleLabel?.text == "-"){
                        theModel.operation = "-"
                        currentOperation = "-"
                        
                    }
                    if(button.titleLabel?.text == "/"){
                        theModel.operation = "/"
                        currentOperation = "/"
                        equals = true
                    }
                    if(button.titleLabel?.text == "x"){
                        theModel.operation = "x"
                        currentOperation = "x"
                        equals = true
                    }
                    if(button.titleLabel?.text == "="){
                        currentOperation = "="
                        
                        
                    }
                    
                    
                    swap = true
                    firstPress = true
                    solved = true
                    binaryNumberEntered = true
                
                hitNegative = false
            }
            else{
                //makes sure the user enters a number before a math sign
//                if(firstOperand == ""){
//                    calc01Display.text = "Try again"
//                    resetCalculator()
//                }
                binaryNumberEntered = true
                if(button.titleLabel?.text == "+"){
                    currentOperation = "+"
                    theModel.firstOperand = firstOperand
                    theModel.operation = "+"
                    binaryNumberEntered = true
                }
                
                if(button.titleLabel?.text == "-"){
                    currentOperation = "-"
                    theModel.operation = "-"

                    theModel.firstOperand = firstOperand
                    binaryNumberEntered = true


                }
                if(button.titleLabel?.text == "="){
                    
                    currentOperation = "="
                    theModel.firstOperand = firstOperand
                    binaryNumberEntered = true
                    theModel.operation = "="



                }
                if(button.titleLabel?.text == "x"){
                    currentOperation = "x"
                    theModel.firstOperand = firstOperand
                    theModel.operation = "x"
                    binaryNumberEntered = true
                }
                
                if(button.titleLabel?.text == "/"){
                    currentOperation = "/"
                    theModel.firstOperand = firstOperand
                    binaryNumberEntered = true
                    theModel.operation = "/"



                }
                
                
            }
        }
//        currentOperation = currentOperation + sender.titleLabel?.text
    }
//    var theModel = TabbedCalc01Model(firstOperand: "",:, secondOperand: "", operation: "", memory: "")

    


}


