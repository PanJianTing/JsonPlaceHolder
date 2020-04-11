//
//  AlbumViewModel.swift
//  JsonPlaceHolder
//
//  Created by panjianting on 2020/4/11.
//  Copyright © 2020 PanJianTing. All rights reserved.
//

import UIKit

class AlbumViewModel: NSObject {
    weak var api:JsonPlaceHolderAPI?
    weak var dataSource:GenericDataSource<Int>?
    
    var onErrorHandler: ((String?) -> Void)?
    
    var onAlbumClick:(([Photo]?) -> Void)?
    
    var albumDic: Dictionary<Int, [Photo]>?
    
    init(dataSource:GenericDataSource<Int>) {
        self.dataSource = dataSource;
        self.api = JsonPlaceHolderAPI.shared;
    }
    
    func getAllAlbum() {
        guard let service = self.api else {
            self.onErrorHandler?("Missing Service");
            return;
        }
        
        service.getPhotos { (photos) in
            DispatchQueue.main.async {
                let photoFactory = PhotoFactory(objectArray: photos);
                self.albumDic = photoFactory.albumeDic;
                self.dataSource?.data.value = Array(photoFactory.albumeDic.keys);
            }
        }
    }
    
    func clickAlbum(index:Int) {
        guard let albumDic = self.albumDic else {
            return
        }
        
        let photos = albumDic[index];
        self.onAlbumClick?(photos)
        
    }
}
