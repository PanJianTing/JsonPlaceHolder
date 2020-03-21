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
    
    var id:Int;
    var titleStr:String;
    
    init(id:Int, title:String) {
        self.id = id;
        self.titleStr = title;
        super.init(nibName: nil, bundle: nil);
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fullScreenSize = self.view.frame.size;
        self.navigationBarHeight = self.navigationController?.navigationBar.frame.size.height ?? 64;
        self.setImageView();
        self.setIdLabel();
        self.setTitieLabel();
        

        // Do any additional setup after loading the view.
    }
    
    private func setImageView(){
        self.imageView = UIImageView(frame: CGRect(x: 0, y: self.navigationBarHeight, width: self.fullScreenSize.width, height: self.fullScreenSize.height/2))
        self.imageView.backgroundColor = UIColor.red;
        
        self.view.addSubview(self.imageView);
    }
    
    private func setIdLabel(){
        self.idLable = UILabel(frame: CGRect(x: 20, y: self.fullScreenSize.height/2+50, width: self.fullScreenSize.width, height: 40))
//        self.idLable.backgroundColor = UIColor.red;
        self.idLable.text = "id : \(self.id)"
        
        self.view.addSubview(self.idLable);
    }
    
    private func setTitieLabel(){
        
        self.titleLabel = UILabel(frame: CGRect(x: 20, y: self.fullScreenSize.height/2+100, width: self.fullScreenSize.width-10, height: 100))
//        self.titleLabel.backgroundColor = UIColor.blue;
        self.titleLabel.text = "Title : \(self.titleStr)"
        self.titleLabel.numberOfLines = 100;
        self.titleLabel.sizeToFit();
        
        self.view.addSubview(self.titleLabel);
        
    }

}
