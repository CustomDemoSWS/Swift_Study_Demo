//
//  BaseViewController.swift
//  Swift_demo
//
//  Created by NetClue on 16/3/23.
//  Copyright © 2016年 Shiwensong. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    //MARK: - LifeCycle

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "基础"
        self.view.backgroundColor = UIColor.whiteColor()
        
        
        // 修改当前标题颜色
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor(red: 20 / 255.0, green:20 / 255.0 , blue: 20 / 255.0, alpha: 1)]
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
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    //MARK: - Protocol Group
    //MARK: - UITableViewDataSource
    //MARK: - UITableViewDelegate
    //MARK: - UIResponder
    //MARK: - Private
    //MARK: - Custom
    
}
