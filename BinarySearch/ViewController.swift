//
//  ViewController.swift
//  BinarySearch
//
//  Created by Sergey Lukaschuk on 08.11.2021.
//

import UIKit

class ViewController: UIViewController {
    
    
    // MARK: - Outlet
    @IBOutlet weak var arrayNumbersTextField: UITextField!
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var restartButton: UIButton!
    @IBOutlet var resultView: [UIView]!
    @IBOutlet weak var indexLabel: UILabel!
    
    // MARK: - Properties
    private let algorithm = BinarySearch()
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // When user touch on screen
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.view.addGestureRecognizer(tap)
        
        // Radius button and view
        startButton.layer.cornerRadius = 10
        restartButton.layer.cornerRadius = 10
        resultView.forEach { $0.layer.cornerRadius = 10 }
    }
    
    
    // MARK: - Private Methods
    // Dismiss keyboard
    @objc private func dismissKeyboard() {
        self.view.endEditing(true)
    }
    
    // Create array from 0 and to 'length'
    private func createArray(length: Int) -> [Int] {
        var array: [Int] = []
        for number in 1...length {
                array.append(number)
            }
        return array
    }
    
    // MARK: - Action
    @IBAction func start(_ sender: UIButton) {
        
        // Get length array
        guard let numberText =
                arrayNumbersTextField.text,
                arrayNumbersTextField.text?.isEmpty == false
                else { self.alertMessage("Please, set the length of the array!"); return }
        
        // Get number
        guard let valueText =
                numberTextField.text,
                numberTextField.text?.isEmpty == false
                else { self.alertMessage("Please, set the number value!"); return }
       
        guard let number = Int(numberText) else { fatalError() }
        guard let value = Int(valueText) else { fatalError() }
        
        if number > 9999999 {
            self.alertMessage("It's very big number!")
            arrayNumbersTextField.text = ""
            return
            
        }
        if number == 0 { self.alertMessage("The array must be > 0")}
        if value > number { self.alertMessage("The value must be <= \(numberText)"); return }
        if value == 0 { self.alertMessage("The value must be > 0"); return }
        
        let array = createArray(length: number)
        let result = algorithm.binarySearch(in: array, for: value)
        
        guard let index = result.0, let counter = result.1 else { fatalError() }
        indexLabel.text = String(index)
        counterLabel.text = String(counter)
    }
    
    @IBAction func restart(_ sender: UIButton) {
        arrayNumbersTextField.text = ""
        numberTextField.text = ""
        counterLabel.text = "0"
        indexLabel.text = "nil"
    }
}

// MARK: Alert message
extension ViewController {
    private func alertMessage(_ text: String) {
        let alert = UIAlertController(title: "Alert", message: text, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            return
        }))
        self.present(alert, animated: true, completion: nil)
        
    }
    
}

