//
//  PhotoFactory.swift
//  TestConnection
//
//  Created by panjianting on 2020/3/20.
//  Copyright © 2020 panjianting. All rights reserved.
//

import UIKit

class PhotoFactory: NSObject {
    
    func getAllPhoto(ObjectArry:Array<Any>) -> Dictionary<Int, Array<Photo>> {
        
        var albumDic:Dictionary = Dictionary<Int, Array<Photo>>();
        
        for object in ObjectArry {
            if object is Dictionary<String, Any>{
                let dic:Dictionary<String, Any> = object as! Dictionary;
                let id:Int = dic["id"] as! Int;
                let albumId:Int = dic["albumId"] as! Int;
                let title:String = dic["title"] as! String;
                let url:String = dic["url"] as! String;
                let thumbnailUrl:String = dic["thumbnailUrl"] as! String;
                
                let photo:Photo = Photo(id: id, albumId: albumId, title: title, url: url, thumbnailUrl: thumbnailUrl);
                
                var photoArray:Array<Photo> = albumDic[albumId] ?? Array();
                photoArray.append(photo);
                
                albumDic[albumId] = photoArray;
            }
        }
        
        return albumDic;
    }
    
    func getAllPhotoArray(albumDic:Dictionary<Int, Array<Photo>>) -> Array<Photo> {
        
        var allPhotoArray:Array<Photo> = Array();
        
        for key in albumDic.keys.sorted() {
            let photoArray = albumDic[key];
            allPhotoArray.append(contentsOf: photoArray!);
        }
        
        return allPhotoArray;
        
    }
}
