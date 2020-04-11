//
//  ShowPhotoViewController.swift
//  JsonPlaceHolder
//
//  Created by PanJianTing on 2020/3/20.
//  Copyright © 2020 PanJianTing. All rights reserved.
//

import UIKit

class ShowPhotoViewController: UIViewController {

    var photoCollectionView : UICollectionView!
//    var photoArray:Array<Photo>
    
    var fullScreenSize : CGSize! {
        return self.view.frame.size;
        
    }
    var navigationBarHeight : CGFloat! {
        return UIApplication.shared.statusBarFrame.height + (self.navigationController?.navigationBar.frame.size.height ?? 64);
    }
    
    var photos:[Photo]?;
    var viewModel: PhotoViewModel?
    var dataSource = PhotoDataSource();
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        let layout = self.setCollectionViewLayout();
        self.setCollectionView(layout: layout);
        self.title = "照片"
        
        self.viewModel = PhotoViewModel(dataSource: self.dataSource, photos: self.photos);
        
        
        self.viewModel?.onErrorHandler = { errorStr in
            print(errorStr as Any);
        }
        
        self.viewModel?.onPhotoClick = { photo in
            guard let photo = photo else {
                return
            }
            let photoDetailViewController = PhotoDetailViewController(photo: photo);
            self.navigationController?.pushViewController(photoDetailViewController, animated: true);
        }
        
        self.dataSource.viewModel = self.viewModel
        
        self.dataSource.data.addAndNotify(self) { [weak self] _  in
            self?.photoCollectionView.reloadData();
        }
        self.viewModel?.getAllPhoto();

    }
    
    // MARK : Set View Component
    private func setCollectionViewLayout() -> UICollectionViewFlowLayout{
        let layout = UICollectionViewFlowLayout();
        
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0);
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = CGFloat(integerLiteral: 0);
        
        layout.itemSize = CGSize(width: self.fullScreenSize.width/4, height: self.fullScreenSize.width/4);
        
//        layout.headerReferenceSize = CGSize(width: self.fullScreenSize.width, height: 0);
//        layout.footerReferenceSize = CGSize(width: self.fullScreenSize.width, height: 0);
        
        return layout;
    }
    
    private func setCollectionView(layout:UICollectionViewFlowLayout){
        self.photoCollectionView = UICollectionView(frame: CGRect(x: 0, y: self.navigationBarHeight, width: self.fullScreenSize.width, height: self.fullScreenSize.height-self.navigationBarHeight),collectionViewLayout: layout);
        
        self.photoCollectionView.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: "PhotoCell");
        
        self.photoCollectionView.delegate = self.dataSource;
        self.photoCollectionView.dataSource = self.dataSource;
        
        self.view.addSubview(self.photoCollectionView);
        
    }
    
}
