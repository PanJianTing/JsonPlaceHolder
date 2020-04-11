//
//  DynamicValue.swift
//  JsonPlaceHolder
//
//  Created by panjianting on 2020/4/11.
//  Copyright © 2020 PanJianTing. All rights reserved.
//

import UIKit

class DynamicValue<T> {
    
    typealias CompletionHandler = ((T) -> Void)
    
    var value : T {
        didSet{
            self.notify();
        }
    }
    
    private var observers = [String : CompletionHandler]();
    
    init(_ value : T) {
        self.value = value;
    }
    
    public func addObserver(_ observer: NSObject, completionHandler: @escaping CompletionHandler){
        observers[observer.description] = completionHandler;
    }
    
    public func addAndNotify(_ observer:NSObject, completionHandle: @escaping CompletionHandler){
        self.addObserver(observer, completionHandler: completionHandle);
        self.notify();
    }
    
    private func notify(){
        observers.forEach( { $0.value(value) } )
    }
    
    deinit {
        observers.removeAll();
    }

}
