//
//  VenueStore.swift
//  FinalExam
//
//  Created by Siamak Eshghi on 2017-04-24.
//  Copyright © 2017 Joopooli. All rights reserved.
//

import UIKit
import CoreData

class VenueStore{
    
    
    var venueDataList : [VenueData] = []
    
    
    
    func saveInCoreData(displayList : [Venue])  {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        for item in displayList {
            
            let loaded = VenueData(context: context)
            loaded.name = item.name
            loaded.distance = item.distance
            loaded.country = item.country
            loaded.contact = item.contact
            loaded.city  = item.city
            loaded.checkingsCount = item.checkinsCount
            context.insert(loaded)
           }
        do{
            try context.save()
        }catch let error{
            print(error)
        }
    }//end saveInCoreData
    
    func clearCoreData( ) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let fetchRequest: NSFetchRequest<VenueData> = VenueData.fetchRequest()
        do{
            let objects = try context.fetch(fetchRequest)
            for obj in objects{
                context.delete(obj)
            }
            try context.save()
        } catch {
            print(String(format: "Error %@: %d",#file, #line))
        }
    }
    //end clearCoreData
    
    
    func loadVenues()  {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<VenueData> = VenueData.fetchRequest()
        do{
            self.venueDataList = try context.fetch(fetchRequest)
            
        }catch{
            print(String(format: "Error %@: %d",#file, #line))
        }
        
        
        
    }//end loadPhotos
    
    
    func fetchedSelectedVenue(selectedName:String) -> VenueData? {

        loadVenues()
        
        for loaded in venueDataList {
            if (loaded.name == selectedName)
            {
            return loaded
            
            }
        }
        return nil
    }//end fetchedSelectedVenue
        
        
    }
    
    
    
    
    
   
    
    


