//
//  ConversionViewController.swift
//  Calculator-Final
//
//  Created by Anand Kulkarni on 7/27/18.
//  Copyright © 2018 Anand Kulkarni. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController {

    @IBOutlet weak var outputDisplay: UITextField!
    @IBOutlet weak var inputDisplay: UITextField!
    
    var number: Double = 0
    var sign = false
    var conversion: Double = 0
    var dotCheck = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clear(_ sender: Any) {
        outputDisplay.text = ""
        inputDisplay.text = ""
        sign = false
        number = 0
    }
    @IBAction func numberPressed(_ sender: UIButton) {
        inputDisplay.text = inputDisplay.text! + String(sender.tag-1)
        number = Double(inputDisplay.text!)!
        convertor()
    }
    
    @IBAction func signChange(_ sender: UIButton) {
        if sign == false{
            number *=  -1
            sign = true;
            inputDisplay.text = "-" + inputDisplay.text!
        }
        else {
            number *= -1
            sign = false;
            inputDisplay.text = String(number)
        }
        convertor()
    }
    
    @IBAction func convertorButton(_ sender: UIButton) {
        let sheet = UIAlertController(title: "Choose Convertor", message: "", preferredStyle: .actionSheet)
        
        let action1 = (UIAlertAction(title: "fahrenheit to celcius", style: .default, handler: {(alertAction) -> Void in
            self.outputDisplay.text = "°F"
            self.inputDisplay.text = "°C"}))
        let action2 = (UIAlertAction(title: "celcius to fahrenheit", style: .default, handler: {(alertAction) -> Void in
            self.outputDisplay.text = "°C"
            self.inputDisplay.text = "°F"})) 

        
        sheet.addAction(action1)
        sheet.addAction(action2)
        
        self.present(sheet, animated: true, completion: nil)
    }
    
    func action1(number: Double) -> Double{
        return ((number - 32) * (5/9))
    }
    func action2(number: Double) -> Double{
        return (number * 9/5 + 32)
    }
    
    func convertor(){
        
        switch (conversion) {
        case 0:
            let celcius = action1(number: number)
            outputDisplay.text = String(celcius)
        case 1:
            let farenhiet = action2(number: number)
            outputDisplay.text = String(farenhiet)
        default:
            print("ERROR: TRY AGAIN!")
            break
        }
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
