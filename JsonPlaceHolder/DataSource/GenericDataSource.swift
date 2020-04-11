//
//  GenericDataSource.swift
//  JsonPlaceHolder
//
//  Created by panjianting on 2020/4/11.
//  Copyright © 2020 PanJianTing. All rights reserved.
//

import UIKit

class GenericDataSource<T>: NSObject {
    var data: DynamicValue<[T]> = DynamicValue([]);
}
