//
//  BaseModel.swift
//  Swift_demo
//
//  Created by NetClue on 16/3/31.
//  Copyright © 2016年 Shiwensong. All rights reserved.
//

import UIKit

class BaseModel: NSObject {

    var access_token: String?
    var remind_in: String?
    var expires_in: String?
    var expires_in: String?

    func initWithDictionary(dict: Dictionary) -> BaseModel! {
        
        super.init()
        
        if dict is Dictionary {
            
            self.setValuesForKeysWithDictionary(dict)
            
        } else {
            
            print("数据不是字典类型")
        }
    }
    
    // 过滤掉字典中没有对应属性的key， 需要修改的属性可以在这个方法中设置
    func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }
}
