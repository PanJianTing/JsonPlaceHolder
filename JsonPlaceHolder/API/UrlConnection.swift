//
//  UrlConnection.swift
//  TestConnection
//
//  Created by panjianting on 2020/3/20.
//  Copyright © 2020 panjianting. All rights reserved.
//

import UIKit

class UrlConnection: NSObject {
    
    let urlString : String;
    
    init(url : String) {
        urlString = url;
    }
        
    func requestWithURL(completion: @escaping (Data) -> Void){
        let urlComponent = URLComponents(string: urlString)!;
        
        guard let queryedURL = urlComponent.url else {
            return
        }
        
        let request = URLRequest(url: queryedURL);
        
        fetchedDataByDataTask(from: request, completion: completion);
    }


    private func fetchedDataByDataTask(from resquest: URLRequest, completion: @escaping (Data) -> Void){
        let task = URLSession.shared.dataTask(with: resquest){
            (data, response, error) in
            
            if error != nil{
                print(error as Any)
            }else{
                guard let data = data else {
                    return
                }
                completion(data);
            }
        }
        
        task.resume();
    }

}
