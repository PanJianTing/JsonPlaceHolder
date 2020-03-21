//
//  JsonPlaceHolderAPI.swift
//  TestConnection
//
//  Created by panjianting on 2020/3/20.
//  Copyright © 2020 panjianting. All rights reserved.
//

import UIKit

class JsonPlaceHolderAPI: NSObject {
    
    private let host = "https://jsonplaceholder.typicode.com"
    private let photo = "/photos"
    
    func getPhotos(completion: @escaping (Any) -> Void ) {
        
        let userDefault = UserDefaults.standard;
        
        let photoData = userDefault.value(forKey: "photoData");
        if photoData != nil {
            print("Get UserDefault");
            completion(photoData!);
        }else{
            print("Get NetWork");
            let urlConnection:UrlConnection = UrlConnection(url: host+photo);
            
            urlConnection.requestWithURL { (data) in
                let dataAny = try! JSONSerialization.jsonObject(with: data, options: .mutableContainers);
                userDefault.set(dataAny, forKey: "photoData");
                completion(dataAny);
            }
        }
        
        
    }
    
    
    

}
