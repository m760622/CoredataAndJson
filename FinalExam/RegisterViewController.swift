//
//  RegisterViewController.swift
//  FinalExam
//
//  Created by Siamak Eshghi on 2017-04-24.
//  Copyright © 2017 Joopooli. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var firstName: UITextField!

    @IBOutlet weak var lastName: UITextField!
    
    @IBOutlet weak var emailName: UITextField!
    
    @IBOutlet weak var pass1: UITextField!
    
    @IBOutlet weak var pass2: UITextField!
    
    @IBOutlet weak var label: UILabel!
    
    let store = UserStore()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func registerTapped(_ sender: Any) {
       
        
      
        if let first = firstName.text, let last = lastName.text , let email = emailName.text , let pas1 = pass1.text ,let pas2 = pass2.text{
            
            if (pas1 == pas2)
            {
                let newUser = User(firstName: first, lastName: last, email: email, pass: pas1)
                store.saveInCoreData(newUser: newUser)
                
                performSegue(withIdentifier: "registerToTableView", sender: "")
                
            }else {
                label.text = "Passwords are not the same"
            }
            
        }else{
            label.text = "Please Fill all fieldes"
        }
        
        
        
    }

    

}
