//
//  PhotoCollectionViewCell.swift
//  JsonPlaceHolder
//
//  Created by PanJianTing on 2020/3/20.
//  Copyright © 2020 PanJianTing. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    var id : String?
    var imageView : UIImageView!;
    var titleLabel : UILabel!;
    var detailLabel : UILabel!;
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        
        let width = UIScreen.main.bounds.size.width;
        let imgSize = width/4;
        
        self.imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: imgSize, height: imgSize));
        self.imageView.image = UIImage(named: "default_image");
        self.imageView.backgroundColor = UIColor.white;
        
        self.titleLabel = UILabel(frame: CGRect(x: 0, y: imgSize/4, width: imgSize, height: imgSize/4));
        self.titleLabel.textAlignment = .center;
        self.titleLabel.textColor = UIColor.black;
        
        self.detailLabel = UILabel(frame: CGRect(x: 0, y: imgSize/4*2, width: imgSize, height: imgSize/4*2));
        self.detailLabel.textAlignment = .center;
        self.detailLabel.textColor = UIColor.black;
        self.detailLabel.numberOfLines = 2;
        self.detailLabel.lineBreakMode = .byWordWrapping;
        
        self.addSubview(self.imageView);
        self.addSubview(self.titleLabel);
        self.addSubview(self.detailLabel);
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
