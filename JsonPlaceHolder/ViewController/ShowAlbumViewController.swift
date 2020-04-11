//
//  ShowAlbumViewController.swift
//  JsonPlaceHolder
//
//  Created by PanJianTing on 2020/3/20.
//  Copyright © 2020 PanJianTing. All rights reserved.
//

import UIKit


class ShowAlbumViewController: UIViewController {
    
    var albumTableView : UITableView!
    
    var fullScreenSize : CGSize! {
        return self.view.frame.size;
        
    }
    var navigationBarHeight : CGFloat! {
        return UIApplication.shared.statusBarFrame.height + (self.navigationController?.navigationBar.frame.size.height ?? 64);
    }
    
    var dataSource = AlbumDataSource();
    var viewModel:AlbumViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setTableView();
        self.title = "相簿";
        
        self.viewModel = AlbumViewModel(dataSource: self.dataSource);
        
        self.viewModel?.onErrorHandler = { errorString in
            print(errorString as Any);
        }
        
        self.viewModel?.onAlbumClick = { photos in
            let showPhotoVC = ShowPhotoViewController()
            showPhotoVC.photos = photos;
            self.navigationController?.pushViewController(showPhotoVC, animated: true);
        }
        
        self.dataSource.viewModel = self.viewModel;
        
        self.dataSource.data.addAndNotify(self) { [weak self] _  in
            self?.albumTableView.reloadData();
        }
        
        
        self.viewModel?.getAllAlbum();
    }
    
    // MARK:Set View Component
    private func setTableView(){
        self.albumTableView = UITableView(frame: CGRect(x: 0, y: self.navigationBarHeight, width: self.fullScreenSize.width, height: self.fullScreenSize.height - self.navigationBarHeight));
        
        self.albumTableView.register(UITableViewCell.self, forCellReuseIdentifier: "AlbumCell");
        self.albumTableView.delegate = self.dataSource;
        self.albumTableView.dataSource = self.dataSource;
        
        
        self.albumTableView.allowsSelection = true;
        self.albumTableView.allowsMultipleSelection = false;
        
        self.view.addSubview(self.albumTableView);
        
    }
    
}
