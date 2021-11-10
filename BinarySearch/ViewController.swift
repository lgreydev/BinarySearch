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
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var indexLabel: UILabel!
    @IBOutlet weak var counterLabel: UILabel!
    
    // MARK: - Properties
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // When user touch on screen
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.view.addGestureRecognizer(tap)
    }
    
    
    // MARK: - Private Methods
    // Dismiss keyboard
    @objc private func dismissKeyboard() {
        self.view.endEditing(true)
    }
    
    // Create array from 0 and to 'length'
    private func createArray() -> [Int] {
        var array: [Int] = []
        guard let arrayLength = arrayNumbersTextField?.text, !arrayLength.isEmpty  else { fatalError() }
        
        if let length = Int(arrayLength) {
            for number in 0..<length {
                array.append(number)
            }
        }
        return array
    }
    
    // MARK: - Action
    @IBAction func start(_ sender: UIButton) {
        let array: [Int] = createArray()
        
        
        print(array)
    }
    
    @IBAction func restart(_ sender: UIButton) {
        arrayNumbersTextField.text = ""
        numberLabel.text = "0"
        indexLabel.text = "0"
        counterLabel.text = "0"
    }
}

