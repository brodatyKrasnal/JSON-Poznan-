//
//JSON-Poznań : ViewController.swift By: Tymon Golęba Frygies on 10:07. 
// Copyright (c) 2020, Tymon Golęba Frygies. All rights reserved.


import UIKit

class ViewController: UIViewController {

    let dataManager = DataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func fetchButtonPressed(_ sender: UIButton) {
        dataManager.fetchData()
    }
    
}

