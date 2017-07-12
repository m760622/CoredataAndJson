//
//  ForgetViewController.swift
//  FinalExam
//
//  Created by Siamak Eshghi on 2017-04-24.
//  Copyright © 2017 Joopooli. All rights reserved.
//

import UIKit

class ForgetViewController: UIViewController {

    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var newPass: UITextField!
    
    @IBOutlet weak var label: UILabel!
    var store = UserStore()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    @IBAction func changePassTapped(_ sender: Any) {
        
        if let em = email.text , let newpas = newPass.text {
            store.changePass(email: em, pass: newpas)
            performSegue(withIdentifier: "loginToTableView", sender: "")
        }else{
            label.text = "Fill all fields"
        }
    }

}
