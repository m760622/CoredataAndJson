//
//  UserStore.swift
//  FinalExam
//
//  Created by Siamak Eshghi on 2017-04-24.
//  Copyright © 2017 Joopooli. All rights reserved.
//

import UIKit
import CoreData


class UserStore{
    
    
    var usreDatList : [UserData] = []
    

    func loadPhotos()  {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<UserData> = UserData.fetchRequest()
        do{
            self.usreDatList = try context.fetch(fetchRequest)
            
        }catch{
            print(String(format: "Error %@: %d",#file, #line))
        }
        
        
        
    }//end loadPhotos
    
    

    func login(firstName:String,password:String) -> Bool  {
        
        loadPhotos()
        
        for loaded in usreDatList
        {
            if(loaded.firstName == firstName && loaded.password == password){
                return true
            }
        }
        return false
    }//end useLoadePhotosFromCoreData
    
    func changePass(email:String,pass:String){
        
        loadPhotos()
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        for loaded in usreDatList{
            if(loaded.email == email){
                loaded.password = pass
                
                do{
                    try context.save()
                }catch let error{
                    print(error)
                }
             
            }
        }
        
       
        
    }
    
    
   
    
 
    func saveInCoreData(newUser:User)  {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        
       let loaded = UserData(context: context)
        
        loaded.firstName = newUser.firstName
        loaded.lastName = newUser.lastName
        loaded.email = newUser.email
        loaded.password = newUser.password
       
        
        do{
            try context.save()
        }catch let error{
            print(error)
        }
    }//end saveInCoreData
    

    func clearCoreData( ) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let fetchRequest: NSFetchRequest<UserData> = UserData.fetchRequest()
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

}
