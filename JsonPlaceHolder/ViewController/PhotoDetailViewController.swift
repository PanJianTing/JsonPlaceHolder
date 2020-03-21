//
//  PhotoDetailViewController.swift
//  JsonPlaceHolder
//
//  Created by PanJianTing on 2020/3/21.
//  Copyright © 2020 PanJianTing. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {

    var imageView : UIImageView!;
    var idLable : UILabel!;
    var titleLabel : UILabel!;
    
    var fullScreenSize : CGSize!
    var navigationBarHeight : CGFloat!
    
    var photo:Photo
    
    init(photo:Photo) {
        self.photo = photo;
        super.init(nibName: nil, bundle: nil);
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad();
        self.view.backgroundColor = UIColor.white;
        self.fullScreenSize = self.view.frame.size;
        self.navigationBarHeight = UIApplication.shared.statusBarFrame.height +  (self.navigationController?.navigationBar.frame.size.height ?? 64);
        self.setImageView();
        self.setIdLabel();
        self.setTitieLabel();
        self.title = "詳細"

        // Do any additional setup after loading the view.
    }
    
    private func setImageView(){
        self.imageView = UIImageView(frame: CGRect(x: 0, y: self.navigationBarHeight, width: self.fullScreenSize.width, height: self.fullScreenSize.width))
        self.imageView.image = UIImage(named: "default_image");
        self.imageView.backgroundColor = UIColor.white;
        self.imageView.contentMode = .scaleAspectFit;
    
        
        self.photo.getImage { (img) in
            DispatchQueue.main.async {
                self.imageView.image = img;
            }
        }
        
        self.view.addSubview(self.imageView);
    }
    
    private func setIdLabel(){
        self.idLable = UILabel(frame: CGRect(x: 20, y:self.navigationBarHeight + self.fullScreenSize.width+10, width: self.fullScreenSize.width, height: 40))
//        self.idLable.backgroundColor = UIColor.red;
         self.idLable.textColor = UIColor.black;
        self.idLable.text = "id : \(self.photo.id)"
        
        self.view.addSubview(self.idLable);
    }
    
    private func setTitieLabel(){
        
        self.titleLabel = UILabel(frame: CGRect(x: 20, y:self.navigationBarHeight + self.fullScreenSize.width+60, width: self.fullScreenSize.width-10, height: 100))
//        self.titleLabel.backgroundColor = UIColor.blue;
        self.titleLabel.textColor = UIColor.black;
        self.titleLabel.text = "Title : \(self.photo.title)"
        self.titleLabel.numberOfLines = 100;
        self.titleLabel.sizeToFit();
        
        self.view.addSubview(self.titleLabel);
        
    }

}
