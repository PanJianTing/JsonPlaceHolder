//
//  ShowAlbumViewController.swift
//  JsonPlaceHolder
//
//  Created by PanJianTing on 2020/3/20.
//  Copyright © 2020 PanJianTing. All rights reserved.
//

import UIKit


class ShowAlbumViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var info = ["林書豪","陳信安","陳偉殷","王建民","陳金鋒","林智勝"]
    
    var albumTableView : UITableView!
    var fullScreenSize : CGSize!
    var navigationBarHeight : CGFloat!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.fullScreenSize = self.view.frame.size;
        self.navigationBarHeight = self.navigationController?.navigationBar.frame.size.height ?? 64;
        self.setTableView();
        
        

        // Do any additional setup after loading the view.
        
    }
    
    
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
        return info.count;
    }
    
    
    // 設定Cell 樣式
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "AlbumCell", for: indexPath) as UITableViewCell;
        cell.textLabel?.text = self.info[indexPath.row];
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true);
        let name = info[indexPath.row];
        print(name);
        
        self.navigationController?.pushViewController(ShowPhotoViewController(), animated: true);
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
