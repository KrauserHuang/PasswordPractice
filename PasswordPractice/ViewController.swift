//
//  ViewController.swift
//  PasswordPractice
//
//  Created by Tai Chin Huang on 2021/1/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var enterLabel: UILabel!
    @IBOutlet weak var passwordOne: UIImageView!
    @IBOutlet weak var passwordTwo: UIImageView!
    @IBOutlet weak var passwordThree: UIImageView!
    @IBOutlet weak var passwordFour: UIImageView!
    @IBOutlet var numberButtons: [UIButton]!
    @IBOutlet weak var deleteLabel: UIButton!
    
    var numbers: Array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0]
    //設定正確密碼
    var correctPassword = "2487"
    //欲輸入密碼
    var typePassword = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        numberButtons.
    }
    
    @IBAction func enterPassword(_ sender: UIButton) {
        if typePassword.count != 4 {
            //若密碼未到第四個時，需要把button回傳currentTitle上的文字加到typePassword上
            if let inputNumber = sender.currentTitle {
                typePassword.append(inputNumber)
                print(typePassword)
                //圖片也要一併更換
                imageChange()
            }
        }
    }
    
    @IBAction func deletePassword(_ sender: UIButton) {
        if typePassword.count != 0 {
//            typePassword.dropLast(1)
            //dropLast可以將最後一個文字拿掉
            typePassword = String(typePassword.dropLast(1))
            print(typePassword)
            imageChange()
        }
    }
    //用SF symbol來顯示圖面在highlighted true/false下變化
    func imageChange() {
        switch typePassword.count {
        case 1:
            passwordOne.isHighlighted = true
            passwordTwo.isHighlighted = false
            passwordThree.isHighlighted = false
            passwordFour.isHighlighted = false
        case 2:
            passwordOne.isHighlighted = true
            passwordTwo.isHighlighted = true
            passwordThree.isHighlighted = false
            passwordFour.isHighlighted = false
        case 3:
            passwordOne.isHighlighted = true
            passwordTwo.isHighlighted = true
            passwordThree.isHighlighted = true
            passwordFour.isHighlighted = false
        case 4:
            passwordOne.isHighlighted = true
            passwordTwo.isHighlighted = true
            passwordThree.isHighlighted = true
            passwordFour.isHighlighted = true
            checkPassword()
        default:
            passwordOne.isHighlighted = false
            passwordTwo.isHighlighted = false
            passwordThree.isHighlighted = false
            passwordFour.isHighlighted = false
        }
    }
    
    func checkPassword() {
        if typePassword == correctPassword {
            let controller = UIAlertController(title: "Correct", message: "Welcome back!", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default) { (_) in
//                self.enterLabel.isHidden = true
//                self.passwordOne.isHidden = true
//                self.passwordTwo.isHidden = true
//                self.passwordThree.isHidden = true
//                self.passwordFour.isHidden = true
//                self.deleteLabel.isHidden = true
                self.reset()
            }
            controller.addAction(action)
            present(controller, animated: true, completion: nil)
        } else {
            let controller = UIAlertController(title: "Wrong", message: "Please try again!", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            controller.addAction(action)
            present(controller, animated: true, completion: reset)
        }
    }
    
    func reset() {
//        Timer.scheduledTimer(withTimeInterval: <#T##TimeInterval#>, repeats: <#T##Bool#>, block: <#T##(Timer) -> Void#>)
        passwordOne.isHighlighted = false
        passwordTwo.isHighlighted = false
        passwordThree.isHighlighted = false
        passwordFour.isHighlighted = false
        typePassword = ""
    }
}

