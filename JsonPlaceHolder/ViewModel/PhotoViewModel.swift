//
//  PhotoViewModel.swift
//  JsonPlaceHolder
//
//  Created by panjianting on 2020/4/11.
//  Copyright © 2020 PanJianTing. All rights reserved.
//

import UIKit

class PhotoViewModel: NSObject {
    
    weak var api:JsonPlaceHolderAPI?
    weak var dataSource:GenericDataSource<Photo>?
    
    var onErrorHandler: ((String?) -> Void)?
    
    var onPhotoClick:((Photo?) -> Void)?
    
    var photos:[Photo]?
    
    
    init(dataSource:GenericDataSource<Photo>, photos:[Photo]?) {
        self.dataSource = dataSource;
        self.api = JsonPlaceHolderAPI.shared;
        self.photos = photos;
    }
    
    func getAllPhoto(){
        guard let service = self.api else {
            self.onErrorHandler?("Missing Service");
            return;
        }
        
        if let photos = self.photos{
            self.dataSource?.data.value = photos
        }else{
            service.getPhotos { (photos) in
                DispatchQueue.main.async {
                    let photoFactory = PhotoFactory(objectArray: photos);
                    self.dataSource?.data.value = photoFactory.allPhotoArray;
                }
            }
        }
    }
    
    func clickCellPhoto(photoIndex:Int) {
        let photo = self.dataSource?.data.value[photoIndex];
        self.onPhotoClick?(photo);
    }
    
    

}
