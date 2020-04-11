//
//  AlbumDataSource.swift
//  JsonPlaceHolder
//
//  Created by panjianting on 2020/4/11.
//  Copyright © 2020 PanJianTing. All rights reserved.
//

import UIKit

class AlbumDataSource: GenericDataSource<Int>, UITableViewDelegate, UITableViewDataSource {
    
    var viewModel:AlbumViewModel?
    
    // MARK:Table Delegate
    
    // 設定tableview數量
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        guard let albumData = self.data.value else {
//            return 0;
//        }
        return self.data.value.count+1;
    }
    
    
    // 設定Cell 樣式
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "AlbumCell", for: indexPath) as UITableViewCell;
        
        if (indexPath.row == 0){
            cell.textLabel?.text = "All"
        }else{
            cell.textLabel?.text = "Album \(indexPath.row)"
        }
        
        
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true);
        
        viewModel?.clickAlbum(index: indexPath.row);
//        guard let photos:Array<Photo> = self.photoData[indexPath.row] else {
//            let nextViewController = ShowPhotoViewController(photo: self.photoFactory.allPhotoArray);
//            self.navigationController?.pushViewController(nextViewController, animated: true);
//            return;
//        }
//
//        let nextViewController = ShowPhotoViewController(photo: photos)
//
//        self.navigationController?.pushViewController(nextViewController, animated: true);
    }
    
}
