//
//  FourSquareWS.swift
//  FourSquare
//
//  Created by Siamak Eshghi on 2017-03-29.
//  Copyright © 2017 Joopooli. All rights reserved.
//

import Foundation

enum Method: String{
    case venueSearch = "venues/search"
    
}
enum FourSquareError: Error{
    case invalidJSOData
    
}


/* ApiUrl for Venue Search : https://api.foursquare.com/v2/venues/search?ll=40.7,-74&client_id=CLIENT_ID&client_secret=CLIENT_SECRET&v=YYYYMMDD */



struct FourSquare{
    
    
    private static let baseURLString = "https://api.foursquare.com/v2/"
    private static let client_id = "CCJZ4SHFUMUBPSOVJDBT4FNMXZNGEMTQ4F4KVJN3GVFEQFLR"
    private static let client_secret = "SESXINWZDQEVCN1MTKM31XMGDDHIROVPTN1XCO4HKA3R5S2M"
    
    
    
    private static let date: String = {
        
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        let dateString = formatter.string(from: date)
        return dateString
    }()
    
    
    
    //create URL
    public static func fourSquareURL() -> URL{
        
        let baseUrlWithMethod = baseURLString + Method.venueSearch.rawValue
        
        var components = URLComponents(string: baseUrlWithMethod)!
        var queryItems = [URLQueryItem]()
        
        let baseParamskeys = ["ll","client_id" ,"client_secret","v"]
        let baseParamsValue = ["40.7,-74",client_id,client_secret,date]
        /*
         let baseParms = [
         "ll" : "40.7,-74",
         "client_id" : client_id,
         "client_secret" : client_secret,
         "v" : date
         ]*/
        
        
        for i in 0...(baseParamskeys.count-1){
            let key = baseParamskeys[i]
            let value = baseParamsValue[i]
            let item = URLQueryItem(name: key, value: value)
            queryItems.append(item)
        }
        
        components.queryItems = queryItems
        
        
        return components.url!
        
    }//end fourSquareURL
    
    
    static func venues(fromJSON data: Data) -> VenueResult{
        do{
            let jsonObject = try JSONSerialization.jsonObject(with: data, options: [])
            guard
                let jsonDictionary = jsonObject as? [AnyHashable:Any],
                let venues = jsonDictionary["response"] as? [String:Any],
                let venueArray = venues["venues"] as? [[String:Any]] else {
                    return .failure(FourSquareError.invalidJSOData)
            }
            var finalVenues = [Venue]()
            
            for venueJSON in venueArray{
                if let venue = venue(fromJSON: venueJSON){
                    finalVenues.append(venue)
                }
            }
            if finalVenues.isEmpty && !venueArray.isEmpty{
                return .failure(FourSquareError.invalidJSOData)
            }
            return .success(finalVenues)
            
        }catch let error{
            return .failure(error)
        }
    }
    
    private static func venue(fromJSON json: [String:Any]) -> Venue?{
       
        
        guard
            let contact = json["contact"] as? [String:Any],
            let name = json["name"] as? String,
            let location = json["location"] as? [String:Any],
            let distance = location["distance"] as? Int,
            let city = location["city"] as? String,
            let country = location["country"] as? String,
            let stats = json["stats"] as? [String:Any],
            let phone = contact["phone"] as? String,
            let checkinsCount = stats["checkinsCount"] as? Int
            
            else {
                
                return nil
        }
        return Venue(name: name, distance: String(distance), checkinsCount: String(checkinsCount), city: city, contact: phone,country:country)
    }
    
}//end FourSquare
