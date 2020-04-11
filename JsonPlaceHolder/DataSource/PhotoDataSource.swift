//
//  PhotoDataSource.swift
//  JsonPlaceHolder
//
//  Created by panjianting on 2020/4/11.
//  Copyright © 2020 PanJianTing. All rights reserved.
//

import UIKit

class PhotoDataSource: GenericDataSource<Photo>, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    var viewModel:PhotoViewModel?
    
    //MARK: Collection View Delegate
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.data.value.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotoCollectionViewCell;
        
        let photo = self.data.value[indexPath.row];
        
        cell.titleLabel.text = "\(photo.id)"
        cell.detailLabel.text = photo.title;
        cell.id = URL(string: photo.thumbnailUrl)?.lastPathComponent;
        cell.imageView.image = UIImage(named: "default_image");
        
        photo.getThumbnailImage { (downloadId, img) in
            DispatchQueue.main.async {
                
                if let id = cell.id{
                    if downloadId == id{
                        cell.imageView.image = img;
                    }
                    
                }
            }
        }
        //        cell.backgroundColor = UIColor.red;
        
        return cell;
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        self.viewModel?.clickCellPhoto(photoIndex: indexPath.row);

    }
}
