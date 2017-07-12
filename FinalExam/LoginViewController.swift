//
//  LoginViewController.swift
//  FinalExam
//
//  Created by Siamak Eshghi on 2017-04-24.
//  Copyright © 2017 Joopooli. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var firstNametext: UITextField!
    @IBOutlet weak var paswordName: UITextField!
    var store = UserStore()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func loginTapped(_ sender: Any) {
        let firstName = firstNametext.text!
        let pass = paswordName.text!
        
        if store.login(firstName: firstName, password: pass)
        {
          performSegue(withIdentifier: "loginToTableView", sender: "")
        }
    }
    
    
}
