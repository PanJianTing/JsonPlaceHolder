//
//  ViewController.swift
//  JsonPlaceHolder
//
//  Created by PanJianTing on 2020/3/19.
//  Copyright © 2020 PanJianTing. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var albumButton : UIButton!
    var textLabel : UILabel!
    var fullScreenSize : CGSize!
    var navigationBarHeight : CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fullScreenSize = self.view.frame.size;
        self.navigationBarHeight = self.navigationController?.navigationBar.frame.size.height ?? 64;
        self.setButton();
        self.setLabel();
        self.title = "Json Place Holder";
    }
    
    @objc func clickButton() {

        self.navigationController?.pushViewController(ShowAlbumViewController(), animated: true)
    }
    
    private func setButton(){
        self.albumButton =  UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 30));
        self.albumButton.setTitle("相簿", for: .normal)
        self.albumButton.setTitleColor(UIColor.gray, for: .normal);
        self.albumButton.setTitleColor(UIColor.black, for: .normal);
        self.albumButton.addTarget( self, action: #selector(clickButton), for:.touchUpInside)
        self.albumButton.center = CGPoint(x: fullScreenSize.width * 0.5, y: fullScreenSize.height * 0.5)
        self.view.addSubview(self.albumButton);
    }
    
    private func setLabel(){
        self.textLabel = UILabel();
        self.textLabel.text = "JSON Placeholder";
        self.textLabel.textColor = UIColor.black;
        self.textLabel.font = UIFont(name: "Helvetica-Light", size: 20);
        self.textLabel.sizeToFit()
        self.textLabel.center = CGPoint(x: fullScreenSize.width * 0.5, y: fullScreenSize.height * 0.15+self.navigationBarHeight)
        self.view.addSubview(self.textLabel);
    }
}

