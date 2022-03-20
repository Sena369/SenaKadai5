//
//  ViewController.swift
//  KadaiChallenge5
//
//  Created by 澤田世那 on 2022/03/17.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var leftTextField: UITextField!
    @IBOutlet private weak var rightTextField: UITextField!
    @IBOutlet private weak var resultLabel: UILabel!
    
    @IBAction private func calculateButton(_ sender: Any) {
        
        guard let leftValue = leftTextField.textToFloat else {
            return presentAlert(message: AlertMessage.leftNonNumric)
        }
        guard let rightValue = rightTextField.textToFloat else {
            return presentAlert(message: AlertMessage.rightNonNumric)
        }
        guard rightValue != 0  else {
            return presentAlert(message: AlertMessage.dividedBy0)
        }
        
        resultLabel.text = String(leftValue / rightValue)
    }
    
    private enum AlertMessage {
        static let leftNonNumric = "割られる数を入力してください"
        static let rightNonNumric = "割る数を入力してください"
        static let dividedBy0 = "割る数には0を入力しないでください"
    }
    
    private func presentAlert (message: String ) {
        let alert = UIAlertController(title: "課題5", message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(defaultAction)
        present(alert, animated: true, completion: nil)
    }
}

extension UITextField {
    var textToFloat : Float? {
        text.flatMap { Float($0) }
    }
}


