//
//  ViewController.swift
//  BinarySearch
//
//  Created by Sergey Lukaschuk on 08.11.2021.
//

import UIKit

class ViewController: UIViewController {
    
    
    // MARK: Outlet
    @IBOutlet weak var arrayNumbersTextField: UITextField!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var indexLabel: UILabel!
    @IBOutlet weak var counterLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    
    // MARK: Action
    @IBAction func start(_ sender: UIButton) {
    }
    
    @IBAction func restart(_ sender: UIButton) {
    }
}

