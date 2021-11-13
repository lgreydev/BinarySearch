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
    @IBOutlet weak var lineView: UIView!
    @IBOutlet weak var indexLabel: UILabel!
    
    
    
    let algorithm = BinarySearch()
    
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
        
        // Radius button and view
        startButton.layer.cornerRadius = 10
        restartButton.layer.cornerRadius = 10
        lineView.layer.cornerRadius = 10
    }
    
    
    // MARK: - Private Methods
    // Dismiss keyboard
    @objc private func dismissKeyboard() {
        self.view.endEditing(true)
    }
    
    // Create array from 0 and to 'length'
    private func createArray(length: Int) -> [Int] {
        var array: [Int] = []
            for number in 0..<length {
                array.append(number)
            }
        }
        return array
    }
    
    // MARK: - Action
    @IBAction func start(_ sender: UIButton) {
        
        
        let array: [Int] = createArray()
        
        guard let text = numberTextField.text else { fatalError()}
        guard let number = Int(text) else { fatalError()}
        
        let result = algorithm.binarySearch(in: array, for: number)
        
        
        
        guard let counterText: String = String(result.1 ?? 0) else { fatalError()}
        
        counterLabel.text = counterText
    }
    
    @IBAction func restart(_ sender: UIButton) {
        arrayNumbersTextField.text = ""
        counterLabel.text = "0"
        indexLabel.text = "nil"
    }
}

