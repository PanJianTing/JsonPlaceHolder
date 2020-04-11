//
//  PhotoFactory.swift
//  TestConnection
//
//  Created by panjianting on 2020/3/20.
//  Copyright © 2020 panjianting. All rights reserved.
//

import UIKit

class PhotoFactory: NSObject {
    
    var objectArray:[Photo];
    var albumeDic:Dictionary<Int, Array<Photo>>{
        get{
            return getAllAlbum(photos: objectArray)
        }
    }
    var allPhotoArray:Array<Photo>{
        get{
            return getAllPhoto(albumDic: albumeDic);
        }
    }
    
    init(objectArray:[Photo]) {
        self.objectArray = objectArray;
        super.init();
    }
    
    private func getAllAlbum(photos:[Photo]) -> Dictionary<Int, Array<Photo>> {
        
        var albumDic:Dictionary = Dictionary<Int, Array<Photo>>();
        
        for photo in photos {
            var photoArray:Array<Photo> = albumDic[photo.albumId] ?? Array();
            photoArray.append(photo);
            albumDic[photo.albumId] = photoArray;
        }
        
        return albumDic;
    }
    
    private func getAllPhoto(albumDic:Dictionary<Int, Array<Photo>>) -> Array<Photo> {
        
        var allPhotoArray:Array<Photo> = Array();
        
        for key in albumDic.keys.sorted() {
            let photoArray = albumDic[key];
            allPhotoArray.append(contentsOf: photoArray!);
        }
        
        return allPhotoArray;
        
    }
}
