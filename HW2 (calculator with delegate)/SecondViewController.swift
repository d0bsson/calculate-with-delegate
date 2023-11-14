//
//  SecondViewController.swift
//  TestDelegate
//
//  Created by d0bsson on 11.11.2023.
//

import UIKit

class SecondViewController: UIViewController {
    
    var delegate: MainViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(firstValueTF)
        view.addSubview(labelCalculator)
        view.addSubview(secondValueTF)
        
        view.addSubview(plusButton)
        view.addSubview(minusButton)
        view.addSubview(multiplyButton)
        view.addSubview(divideButton)
    }
    
    lazy var labelCalculator = {
        let label = UILabel(frame: CGRect(x: 50, y: 70, width: 300, height: 50))
        label.text = "Введите данные"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        
        return label
    }()
    
    lazy var firstValueTF: UITextField = {
        let field = UITextField(frame: CGRect(x: 60, y: 120, width: 100, height: 55))
        field.placeholder = " Число 1"
        field.backgroundColor = UIColor(_colorLiteralRed: 0, green: 0, blue: 0, alpha: 0.1)
        field.borderStyle = .roundedRect
        field.layer.cornerRadius = 3
        return field
    }()
    
    
    lazy var secondValueTF: UITextField = {
        let field = UITextField(frame: CGRect(x: 200, y: 120, width: 100, height: 55))
        field.placeholder = " Число 2"
        field.backgroundColor = UIColor(_colorLiteralRed: 0, green: 0, blue: 0, alpha: 0.1)
        field.borderStyle = .roundedRect
        field.layer.cornerRadius = 3
        return field
    }()
    
    lazy var plusButton = {
        let btn = UIButton(frame: CGRect(x: 50, y: 420, width: 50, height: 50), primaryAction: plusButtonAction)
        btn.setTitle("+", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .init(_colorLiteralRed: 0/255, green: 133/255, blue: 255/255, alpha: 1)
        return btn
    }()
    
    lazy var minusButton = {
        let btn = UIButton(frame: CGRect(x: 120, y: 420, width: 50, height: 50), primaryAction: minusButtonAction)
        btn.setTitle("-", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .init(_colorLiteralRed: 0/255, green: 133/255, blue: 255/255, alpha: 1)
        return btn
    }()
    
    lazy var multiplyButton = {
        let btn = UIButton(frame: CGRect(x: 190, y: 420, width: 50, height: 50), primaryAction: multiplyButtonAction)
        btn.setTitle("*", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .init(_colorLiteralRed: 0/255, green: 133/255, blue: 255/255, alpha: 1)
        return btn
    }()
    
    lazy var divideButton = {
        let btn = UIButton(frame: CGRect(x: 260, y: 420, width: 50, height: 50), primaryAction: divideButtonAction)
        btn.setTitle("/", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .init(_colorLiteralRed: 0/255, green: 133/255, blue: 255/255, alpha: 1)
        return btn
    }()
    
    lazy var plusButtonAction = UIAction { [self] _ in
        if firstValueTF.text != "" && secondValueTF.text != "" {
            delegate?.plus(firstValue: firstValueTF.text!, secondValue: secondValueTF.text!)
            navigationController?.popViewController(animated: true)
        } else {
            alert()
        }
    }
    
    lazy var minusButtonAction = UIAction { [self] _ in
        if firstValueTF.text != "" && secondValueTF.text != "" {
            delegate?.minus(firstValue: firstValueTF.text!, secondValue: secondValueTF.text!)
            navigationController?.popViewController(animated: true)
        } else {
            alert()
        }
        
    }
    
    lazy var divideButtonAction = UIAction { [self] _ in
        if  secondValueTF.text == "0" {
            alertDivideToNone()
        } else if firstValueTF.text != "" && secondValueTF.text != "" {
            delegate?.divide(firstValue: firstValueTF.text!, secondValue: secondValueTF.text!)
            navigationController?.popViewController(animated: true)
        } else {
            alert()
        }
        
    }
    
    lazy var multiplyButtonAction = UIAction { [self] _ in
        if firstValueTF.text != "" && secondValueTF.text != "" {
            delegate?.multiply(firstValue: firstValueTF.text!, secondValue: secondValueTF.text!)
            navigationController?.popViewController(animated: true)
        } else {
            alert()
        }
    }
}

extension SecondViewController {
    private func alert() {
        let alert = UIAlertController(title: "Ошибка!", message: "Введите данные до конца", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default))
        self.present(alert, animated: true)
    }
    private func alertDivideToNone() {
        let alert = UIAlertController(title: "Ошибка!", message: "Ислам, нельзя делить на 0, ну чего ты!", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default))
        self.present(alert, animated: true)
    }
}
