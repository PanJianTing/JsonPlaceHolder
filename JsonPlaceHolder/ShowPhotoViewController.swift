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
    var fullScreenSize : CGSize!
    var navigationBarHeight : CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.fullScreenSize = self.view.frame.size;
        self.navigationBarHeight = self.navigationController?.navigationBar.frame.size.height ?? 64;
        let layout = self.setCollectionViewLayout();
        self.setCollectionView(layout: layout);
    }
    
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
        self.photoCollectionView = UICollectionView(frame: CGRect(x: 0, y: self.navigationBarHeight, width: self.fullScreenSize.width, height: self.fullScreenSize.height),
                                                    collectionViewLayout: layout);
        
        self.photoCollectionView.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: "PhotoCell");
        
//        self.photoCollectionView.register(UICollectionReusableView.self,
//                                          forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
//                                          withReuseIdentifier: "PhotoHeader");
//        self.photoCollectionView.register(UICollectionReusableView.self,
//                                          forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
//                                          withReuseIdentifier: "PhotoFooter");
        
        
        self.photoCollectionView.delegate = self;
        self.photoCollectionView.dataSource = self;
        
        self.photoCollectionView.frame = CGRect(x: 0, y: self.navigationBarHeight, width: self.fullScreenSize.width, height: self.fullScreenSize.height);
        
        self.view.addSubview(self.photoCollectionView);
        
    }
    
    
    //MARK: Collection View Delegate

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5000;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotoCollectionViewCell;
        
//        cell.imageView.backgroundColor = UIColor.red;
        cell.titleLabel.text = "\(indexPath.item + 1)"
        cell.detailLabel.text = "accusamus beatae ad facilis cum similique qui sunt";
        
        cell.backgroundColor = UIColor.red;
        
        return cell;
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let name = info[indexPath.row];
//        print(name);
        
        let photoDetailViewController = PhotoDetailViewController(id: indexPath.row, title: "accusamus beatae ad facilis cum similique qui sunt");
        
        self.navigationController?.pushViewController(photoDetailViewController, animated: true);
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
