//
//  JsonPlaceHolderAPI.swift
//  TestConnection
//
//  Created by panjianting on 2020/3/20.
//  Copyright © 2020 panjianting. All rights reserved.
//

import UIKit

class JsonPlaceHolderAPI: NSObject {
    
    static let shared = JsonPlaceHolderAPI();
    
    private let host = "https://jsonplaceholder.typicode.com"
    private let photo = "/photos"
    
    func getPhotos(completion: @escaping ([Photo]) -> Void ) {
        
        let userDefault = UserDefaults.standard;
        
        let photoData = userDefault.value(forKey: "photoData") as? Data;
        if let data = photoData {
            print("Get UserDefault");
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            let photoArray = try! decoder.decode([Photo].self, from: data);
            completion(photoArray);
        }else{
            print("Get NetWork");
            let urlConnection:UrlConnection = UrlConnection(url: host+photo);
            
            urlConnection.requestWithURL { (data) in
                
                userDefault.set(data, forKey: "photoData");
                
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let photoArray = try! decoder.decode([Photo].self, from: data);
                completion(photoArray);
                
            }
        }
    }
    
    
    

}
