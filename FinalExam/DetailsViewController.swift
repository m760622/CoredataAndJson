//
//  DetailsViewController.swift
//  FinalExam
//
//  Created by Siamak Eshghi on 2017-04-24.
//  Copyright © 2017 Joopooli. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var contact: UILabel!
    
    @IBOutlet weak var distance: UILabel!
    
    @IBOutlet weak var checking: UILabel!
    
    @IBOutlet weak var city: UILabel!
    
    @IBOutlet weak var country: UILabel!
    
    var currentName : String = ""
    var venueStore = VenueStore()
    var currentVenue = VenueData()

    override func viewDidLoad() {
        super.viewDidLoad()
        currentVenue = venueStore.fetchedSelectedVenue(selectedName: currentName)!
        initialize()
    }

    func initialize() {
        
        self.title = currentVenue.name!
        self.checking.text = "Checkings: " + currentVenue.checkingsCount!
        self.city.text = "City: " + currentVenue.city!
        self.contact.text = "Contact: " + currentVenue.contact!
        self.distance.text = "Distance: " + currentVenue.distance!
        self.country.text = "Country: " + currentVenue.country!
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
