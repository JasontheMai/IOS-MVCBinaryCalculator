//
//  HistoryViewController.swift
//  TabbedCalc01
//
//  Created by Jason Mai on 2/9/23.
//

import UIKit

class HistoryViewController: UIViewController {
    

    var appDelegate: AppDelegate?
    var theModel: Calc01Model = Calc01Model(firstOperand: "", secondOperand: "", operation: "", oldMemory: "", memorySign: "", newMemory: "", solution: "")
    
    override func viewDidLoad() {
        //view did appear loads everytime
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        if let theModelRef = self.appDelegate?.theModel{
                        self.theModel = theModelRef
                    }
        textField.text = ""
        
        
        

    }
    override func viewDidAppear(_ animated: Bool) {
        
        textField.text += theModel.memory
        textField.text += "\n"
        textField.text += "\n"


        theModel.memory = ""
        
    }
    

    
    @IBOutlet weak var textField: UITextView!
    
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
