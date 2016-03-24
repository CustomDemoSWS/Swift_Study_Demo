//
//  DetailViewController.swift
//  Swift_demo
//
//  Created by NetClue on 16/3/22.
//  Copyright © 2016年 Shiwensong. All rights reserved.
//

import Foundation
import UIKit

class DetailViewController : UIViewController  {
    var number: Int?
    
    override func viewDidLoad() {
        
        self.title = "详情页面"

        self.view.backgroundColor = UIColor.whiteColor()
        
        let lable = UILabel(frame: CGRectMake(100, 200, 300, 50))
        self.view.addSubview(lable)
        lable.text = String(number!)
        lable.textColor = UIColor.redColor()
        
    }

}

