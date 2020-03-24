//
//  ShowPhotoViewController.swift
//  JsonPlaceHolder
//
//  Created by PanJianTing on 2020/3/20.
//  Copyright © 2020 PanJianTing. All rights reserved.
//

import UIKit

class ShowPhotoViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    var photoCollectionView : UICollectionView!
    var photoArray:Array<Photo>
    
    var fullScreenSize : CGSize! {
        return self.view.frame.size;
        
    }
    var navigationBarHeight : CGFloat! {
        return UIApplication.shared.statusBarFrame.height + (self.navigationController?.navigationBar.frame.size.height ?? 64);
    }
    
    init(photo:Array<Photo>) {
        self.photoArray = photo;
        super.init(nibName: nil, bundle: nil);
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        let layout = self.setCollectionViewLayout();
        self.setCollectionView(layout: layout);
        self.title = "照片"
        
        print(self.photoArray.count);
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
        
        self.photoCollectionView.delegate = self;
        self.photoCollectionView.dataSource = self;
        
        self.view.addSubview(self.photoCollectionView);
        
    }
    
    
    //MARK: Collection View Delegate

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoArray.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotoCollectionViewCell;
        
        let photo = self.photoArray[indexPath.row];
        
        cell.titleLabel.text = "\(photo.id)"
        cell.detailLabel.text = photo.title;
        
        photo.getThumbnailImage { (img) in
            DispatchQueue.main.async {
                cell.imageView.image = img;
            }
        }
//        cell.backgroundColor = UIColor.red;
        
        return cell;
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let photo = self.photoArray[indexPath.row];
        
        let photoDetailViewController = PhotoDetailViewController(photo: photo);
        self.navigationController?.pushViewController(photoDetailViewController, animated: true);
    }

}
