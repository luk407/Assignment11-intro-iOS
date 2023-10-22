//
//  ViewController.swift
//  Assignment11-intro-iOS
//
//  Created by Luka Gazdeliani on 22.10.23.
//

import UIKit

class ViewController: UIViewController {

    //MARK: -IBOutlets
    // iPhone 14 Pro
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var typeSwitch: UISwitch!
    @IBOutlet weak var num1TextField: UITextField!
    @IBOutlet weak var num2TextField: UITextField!
    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var textFieldsView: UIView!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var resultView: UIView!
    
    //MARK: -LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        typeLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        typeLabel.text = "უსჯ"
        resultLabel.text = "0"
        textFieldsView.layer.cornerRadius = 10
        headerView.layer.cornerRadius = 10
        resultView.layer.cornerRadius = 10
    }

    //MARK: -IBActions
    @IBAction func typeChange(_ sender: Any) {
        if typeSwitch.isOn {
            typeLabel.text = "უსჯ"
        } else {
            typeLabel.text = "უსგ"
        }
    }
    
    @IBAction func calculateClick(_ sender: Any) {
        intCheck()
        
        if !typeSwitch.isOn {
            if  Int(num1TextField.text!) != nil && Int(num2TextField.text!) != nil {
                resultLabel.text =  String(calculateGCD(Int(num1TextField.text!)!, Int(num2TextField.text!)!))
            } else {
                resultLabel.text = "შეიყვანეთ მხოლოდ მთელი რიცხვები!"
            }
        } else {
            if Int(num1TextField.text!) != nil && Int(num2TextField.text!) != nil {
                resultLabel.text = String(calculateLCM(Int(num1TextField.text!)!, Int(num2TextField.text!)!))
            } else {
                resultLabel.text = "შეიყვანეთ მხოლოდ მთელი რიცხვები!"
            }
        }
    }
    
    //MARK: -Methods
    // მეთოდები მე თვითონ არ მომოფიქრებია. მაგრამ გააზრებულად "გადავიწერე" :დ. ლინკებს მივუთითებ :)
    
    // https://www.tutorialspoint.com/swift-program-to-find-gcd-of-two-numbers
    func calculateGCD(_ num1: Int, _ num2: Int) -> Int {
        let remainder = num1 % num2
        if remainder != 0 {
            return calculateGCD(num2, remainder)
        } else {
            return num2
        }
    }
    
    // https://www.tutorialspoint.com/swift-program-to-find-lcm-of-two-numbers
    func calculateLCM(_ num1: Int, _ num2: Int) -> Int {
        num1 * num2/calculateGCD(num1, num2)
    }
    
    func intCheck() {
        if Int(num1TextField.text!) == nil {
            num1TextField.backgroundColor = .red
        } else {
            num1TextField.backgroundColor = .white
        }
        
        if Int(num2TextField.text!) == nil {
            num2TextField.backgroundColor = .red
        } else {
            num2TextField.backgroundColor = .white
        }
    }
}
