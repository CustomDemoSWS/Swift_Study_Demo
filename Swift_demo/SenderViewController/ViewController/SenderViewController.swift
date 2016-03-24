//
//  SenderViewController.swift
//  Swift_demo
//
//  Created by NetClue on 16/3/23.
//  Copyright © 2016年 Shiwensong. All rights reserved.
//

import UIKit

class SenderViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "发微博"

        // Do any additional setup after loading the view.
        self.view.addSubview(self.customButton)
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    //MARK: - LifeCycle
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
    
    func customButtonOnClick(button: UIButton) {
        
        self.navigationController!.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    //MARK: - Private
    //MARK: - Custom
    var customButton: UIButton {
        get {
            let customButton1 = UIButton(type: UIButtonType.Custom)
            customButton1.setTitle("返回", forState: UIControlState.Normal)
            customButton1.frame = CGRectMake(100, 200, 100, 50)
            customButton1.backgroundColor = UIColor.redColor()
            customButton1.addTarget(self, action: Selector("customButtonOnClick:"), forControlEvents: UIControlEvents.TouchUpInside)
            return customButton1
        }
        
        set{
            
        }
    }

    
    
}
