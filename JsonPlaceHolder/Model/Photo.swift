//
//  Photo.swift
//  TestConnection
//
//  Created by panjianting on 2020/3/20.
//  Copyright © 2020 panjianting. All rights reserved.
//

import UIKit

class Photo: NSObject {
    
    let id : Int;
    let albumId : Int;
    let title : String;
    let url : String;
    let thumbnailUrl : String;
    
    init(id:Int, albumId:Int, title:String, url:String, thumbnailUrl:String) {
        self.id = id;
        self.albumId = albumId;
        self.title = title;
        self.url = url;
        self.thumbnailUrl = thumbnailUrl;
    }
    
    func getImage(completion:@escaping (UIImage) -> Void) {
        let url = URL(string: self.url)!;
        
        let tempDirectory = FileManager.default.temporaryDirectory;
        
        let imageFileUrl = tempDirectory.appendingPathComponent(url.lastPathComponent);
        
        if FileManager.default.fileExists(atPath: imageFileUrl.path) {
            let image = UIImage(contentsOfFile: imageFileUrl.path)!;
//            guard let image = UIImage(contentsOfFile: imageFileUrl.path) else {
//                completion(nil);
//            }
           completion(image)
        } else {
           
           let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
              if let data = data, let image = UIImage(data: data) {
                 try? data.write(to: imageFileUrl)
                completion(image);
                
                
//                 DispatchQueue.main.async {
//                    self.imageView.image = image
//                 }
              }
           }
           task.resume()
        }
    }
    
    func getThumbnailImage(completion:@escaping (UIImage) -> Void) {
            let url = URL(string: self.thumbnailUrl)!;
            
            let tempDirectory = FileManager.default.temporaryDirectory;
            
            let imageFileUrl = tempDirectory.appendingPathComponent("150/"+url.lastPathComponent);
            print(imageFileUrl.path)
            if FileManager.default.fileExists(atPath: imageFileUrl.path) {
                let image = UIImage(contentsOfFile: imageFileUrl.path)!;
    //            guard let image = UIImage(contentsOfFile: imageFileUrl.path) else {
    //                completion(nil);
    //            }
               completion(image)
            } else {
               
               let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                  if let data = data, let image = UIImage(data: data) {
                     try? data.write(to: imageFileUrl)
                    completion(image);
                    
                    
//                     DispatchQueue.main.async {
//                        self.imageView.image = image
//                     }
                  }
               }
               task.resume()
            }
        }

}
