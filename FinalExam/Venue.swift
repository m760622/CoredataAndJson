//
//  Venue.swift
//  FinalExam
//
//  Created by Siamak Eshghi on 2017-04-24.
//  Copyright © 2017 Joopooli. All rights reserved.
//

import UIKit

class Venue: NSObject {
    
    let name : String
    let distance : String
    let checkinsCount : String
    let city : String
    let contact : String
    let country : String
    
    
    init(name:String,distance:String,checkinsCount: String,city:String,contact:String,country:String) {
        self.name = name
        self.distance = distance
        self.checkinsCount = checkinsCount
        self.city = city
        self.contact = contact
        self.country = country
    }
    
    

}
