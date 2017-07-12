//
//  FourSquareWSStore.swift
//  FourSquare
//
//  Created by Siamak Eshghi on 2017-03-30.
//  Copyright © 2017 Joopooli. All rights reserved.
//

import UIKit

enum VenueResult{
    case success([Venue])
    case failure(Error)
}

class FourSquareWSStore{
    
    private let session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()
    
    func fetchVenue(completion: @escaping (VenueResult) -> Void){
        let url = FourSquare.fourSquareURL()
        print("url = \(url)")
        
        
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request) {
            (data, response, error) -> Void in
            
            
            let result = self.processVenusRequest(data: data, error: error)//use the
            
            
            
            OperationQueue.main.addOperation {
                completion(result)
            }
            
        }
        
        
        task.resume()
    }
    
    private func processVenusRequest(data: Data?,error: Error?) -> VenueResult{
        guard let jsonData = data else {
            return .failure(error!)
        }
        return FourSquare.venues(fromJSON: jsonData)
    }
    
}//end class FourSquareWSStore
