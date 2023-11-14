//
//  ViewController.swift
//  TestDelegate
//
//  Created by d0bsson on 11.11.2023.
//

import UIKit

protocol MainViewControllerDelegate {
    func plus(firstValue: String, secondValue: String)
    func minus(firstValue: String, secondValue: String)
    func multiply(firstValue: String, secondValue: String)
    func divide(firstValue: String, secondValue: String)
}

class MainViewController: UIViewController, MainViewControllerDelegate {
    
    var firstValue = ""
    var secondValue = ""
    var operation = ""
    var result = ""
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(calculateButton)
        
        view.addSubview(labelCalculator)
        view.addSubview(labelResult)
        view.addSubview(labelFirstValue)
        view.addSubview(labelOperator)
        view.addSubview(labelSecondValue)
        view.addSubview(labelEqually)
        view.addSubview(labelSummary)
    }
    
    //MARK: -  Public Functions
    func plus(firstValue: String, secondValue: String) {
        labelFirstValue.text = firstValue
        labelSecondValue.text = secondValue
        if let a = Int(firstValue), let b = Int(secondValue) {
            let c = a + b
            labelSummary.text = String(c)
            labelOperator.text = "+"
            labelEqually.text = "="
        }
    }
    
    func minus(firstValue: String, secondValue: String) {
        labelFirstValue.text = firstValue
        labelSecondValue.text = secondValue
        if let a = Int(firstValue), let b = Int(secondValue) {
            let c = a - b
            labelSummary.text = String(c)
            labelOperator.text = "-"
            labelEqually.text = "="
        }
    }
    
    func multiply(firstValue: String, secondValue: String) {
        labelFirstValue.text = firstValue
        labelSecondValue.text = secondValue
        if let a = Int(firstValue), let b = Int(secondValue) {
            let c = a * b
            labelSummary.text = String(c)
            labelOperator.text = "*"
            labelEqually.text = "="
        }
    }
    
    func divide(firstValue: String, secondValue: String) {
        labelFirstValue.text = firstValue
        labelSecondValue.text = secondValue
        if let a = Int(firstValue), let b = Int(secondValue) {
            let c = a / b
            labelSummary.text = String(c)
            labelOperator.text = "/"
            labelEqually.text = "="
        }
    }
    
    //MARK: - Labels
    lazy var labelFirstValue = {
        let label = UILabel(frame: CGRect(x: 50, y: 170, width: 100, height: 100))
        label.text = firstValue
        label.font = UIFont.systemFont(ofSize: 46)
        return label
    }()
    
    lazy var labelOperator = {
        let label = UILabel(frame: CGRect(x: 120, y: 170, width: 100, height: 100))
        label.text = operation
        label.font = UIFont.systemFont(ofSize: 46)
        return label
    }()
    
    lazy var labelSecondValue = {
        let label = UILabel(frame: CGRect(x: 160, y: 170, width: 100, height: 100))
        label.text = secondValue
        label.font = UIFont.systemFont(ofSize: 46)
        return label
    }()
    
    lazy var labelEqually = {
        let label = UILabel(frame: CGRect(x: 230, y: 170, width: 100, height: 100))
        if labelSummary.text != "" {
            label.text = "="
        }
        label.font = UIFont.systemFont(ofSize: 46)
        return label
    }()
    
    lazy var labelSummary = {
        let label = UILabel(frame: CGRect(x: 270, y: 170, width: 100, height: 100))
        label.text = result
        label.font = UIFont.systemFont(ofSize: 46)
        return label
    }()
    
    lazy var labelCalculator = {
        let label = UILabel(frame: CGRect(x: 50, y: 70, width: 150, height: 50))
        label.text = "Калькулятор"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        return label
    }()
    
    lazy var labelResult = {
        let label = UILabel(frame: CGRect(x: view.center.x - 40, y: 150, width: 150, height: 50))
        label.text = "Результат"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    //MARK: - Battons & Actions
    lazy var calculateButton = {
        let btn = UIButton(frame: CGRect(x: 50, y: 350, width: 300, height: 54), primaryAction: calculateButtonAction)
        btn.setTitle("Посчитать", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .init(_colorLiteralRed: 0/255, green: 133/255, blue: 255/255, alpha: 1)
        return btn
    }()
    
    lazy var calculateButtonAction = UIAction { _ in
        
        let vc = SecondViewController()
        vc.delegate = self
        vc.firstValueTF.text = self.labelFirstValue.text
        vc.secondValueTF.text = self.labelSecondValue.text
        self.navigationController?.pushViewController(vc, animated: true)
    }
}


