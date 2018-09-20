//
//  CreateAccountVC.swift
//  Smack
//
//  Created by Admin on 20.09.2018.
//  Copyright © 2018 vocabularity. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    @IBAction func closePressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    

}
