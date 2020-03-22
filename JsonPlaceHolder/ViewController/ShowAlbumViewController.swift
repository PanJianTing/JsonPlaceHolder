//
//  ShowAlbumViewController.swift
//  JsonPlaceHolder
//
//  Created by PanJianTing on 2020/3/20.
//  Copyright © 2020 PanJianTing. All rights reserved.
//

import UIKit


class ShowAlbumViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var albumTableView : UITableView!
    
    let api:JsonPlaceHolderAPI! = JsonPlaceHolderAPI();
    var photoFactory:PhotoFactory!
    var photoData:Dictionary<Int, Array<Photo>>!;
    
    var fullScreenSize : CGSize! {
        return self.view.frame.size;
        
    }
    var navigationBarHeight : CGFloat! {
        return UIApplication.shared.statusBarFrame.height + (self.navigationController?.navigationBar.frame.size.height ?? 64);
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setTableView();
        self.title = "相簿";
        api.getPhotos { (data) in
            let objectArray:Array = data as! Array<Any>;
            self.photoFactory = PhotoFactory(objectArray: objectArray);
            self.photoData = self.photoFactory.albumeDic;
            DispatchQueue.main.async {
                self.albumTableView.reloadData();
            }
            
        }
    }
    
    // MARK:Set View Component
    private func setTableView(){
        self.albumTableView = UITableView(frame: CGRect(x: 0, y: self.navigationBarHeight, width: self.fullScreenSize.width, height: self.fullScreenSize.height));
        
        self.albumTableView.register(UITableViewCell.self, forCellReuseIdentifier: "AlbumCell");
        self.albumTableView.delegate = self;
        self.albumTableView.dataSource = self;
        
        
        self.albumTableView.allowsSelection = true;
        self.albumTableView.allowsMultipleSelection = false;
        
        self.view.addSubview(self.albumTableView);
        
    }
    
    
    // MARK:Table Delegate
    
    // 設定tableview數量
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let albumData = self.photoData else {
            return 0;
        }
        return albumData.keys.count + 1;
    }
    
    
    // 設定Cell 樣式
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "AlbumCell", for: indexPath) as UITableViewCell;
//        let albumIndex = self.photoData[indexPath.row]?[0].albumId;
        guard let albumIndex = self.photoData[indexPath.row]?[0].albumId else {
            cell.textLabel?.text = "All";
            return cell;
        }
        cell.textLabel?.text = "Album \(albumIndex)"
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true);
        
        guard let photos:Array<Photo> = self.photoData[indexPath.row] else {
            let nextViewController = ShowPhotoViewController(photo: self.photoFactory.allPhotoArray);
            self.navigationController?.pushViewController(nextViewController, animated: true);
            return;
        }
        
        let nextViewController = ShowPhotoViewController(photo: photos)
        
        self.navigationController?.pushViewController(nextViewController, animated: true);
    }

}
