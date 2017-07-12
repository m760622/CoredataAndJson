//
//  User.swift
//  FinalExam
//
//  Created by Siamak Eshghi on 2017-04-24.
//  Copyright © 2017 Joopooli. All rights reserved.
//

import UIKit

class User: NSObject {

    private var _firstName : String
    private var _lastName : String
    private var _email : String
    private var _pass : String
   
    
     init(firstName:String,lastName:String,email:String,pass:String) {
        self._firstName = firstName
        self._lastName = lastName
        self._email = email
        self._pass = pass
        
    }
    
    var firstName:String{
        get{
            return self._firstName
        }
        set{
            self._firstName = newValue
        }
    }
    
    var lastName:String{
        get{
            return self._lastName
        }
        set{
            self._lastName = newValue
        }
    }
    
    var email:String{
        get{
            return self._email
        }
        set{
            self._email = newValue
        }
    }
    
    var password:String{
        get{
            return self._pass
        }
        set{
            self._pass = newValue
        }
    }
}
