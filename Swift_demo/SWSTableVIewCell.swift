//
//  SWSTableVIewCell.swift
//  Swift_demo
//
//  Created by NetClue on 16/3/22.
//  Copyright © 2016年 Shiwensong. All rights reserved.
//

import Foundation
import UIKit

class SWSTableViewCell: UITableViewCell {
    
    var cellImageView: UIImageView?
    var cellTitle: UILabel?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {

        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        cellImageView = UIImageView(frame: CGRectMake(10, 10, 60, 60))
        self.contentView.addSubview(cellImageView!)
        cellImageView!.layer.cornerRadius = 5.0
        cellImageView!.layer.masksToBounds = true
        
        
        cellTitle = UILabel(frame: CGRectMake(80,30,100,20))
        self.contentView.addSubview(cellTitle!)
        cellTitle!.font = UIFont.systemFontOfSize(12)
        cellTitle!.textColor = UIColor.redColor()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
