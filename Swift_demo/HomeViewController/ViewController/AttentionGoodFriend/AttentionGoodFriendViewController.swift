//
//  AttentionGoodFriendViewController.swift
//  Swift_demo
//
//  Created by NetClue on 16/3/24.
//  Copyright © 2016年 Shiwensong. All rights reserved.
//

import UIKit

class AttentionGoodFriendViewController: BaseViewController {
    
    //MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "好友关注动态"
        
        // 创建左边的 关注好友按钮
        let customBackButton = UIButton(type: UIButtonType.Custom)
        customBackButton.frame = CGRectMake(0, 0, 52, 30)
        customBackButton.setImage(UIImage(named: "navigationbar_back_withtext"), forState: UIControlState.Normal)
        customBackButton.setImage(UIImage(named: "navigationbar_back_withtext_highlighted"), forState: UIControlState.Highlighted)
        customBackButton.setTitle("首页", forState: UIControlState.Normal)
        customBackButton.setTitleColor(UIColor.grayColor(), forState: UIControlState.Normal)
        customBackButton.setTitleColor(UIColor.orangeColor(), forState: UIControlState.Highlighted)
        customBackButton.addTarget(self, action: "customBacknButtonOnClick:", forControlEvents: UIControlEvents.TouchUpInside)
        //用于消除左边空隙，要不然按钮顶不到最前面
        let spacerButton = UIBarButtonItem(barButtonSystemItem: .FixedSpace, target: nil,
            action: nil)
        spacerButton.width = -10;
        
        let custombackButtonItem = UIBarButtonItem(customView: customBackButton)
        self.navigationItem.leftBarButtonItems = [spacerButton,custombackButtonItem]
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    deinit{
        print("内存释放 -- \(String(self.classForCoder))")
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    //MARK: - Protocol Group
    //MARK: - UITableViewDataSource
    //MARK: - UITableViewDelegate
    //MARK: - UIResponder
    
    //MARK: - IBAction
    
    func customBacknButtonOnClick(button: UIButton) {
        
        self.navigationController?.popViewControllerAnimated(true)
        
    }

    //MARK: - Private
    //MARK: - Custom


}
