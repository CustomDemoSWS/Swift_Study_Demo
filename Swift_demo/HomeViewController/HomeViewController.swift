//
//  HomeViewController.swift
//  Swift_demo
//
//  Created by NetClue on 16/3/23.
//  Copyright © 2016年 Shiwensong. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {
    
    //MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "首页"
        // 创建左边的 关注好友按钮
        let attentionGoodFriednButton = UIButton(type: UIButtonType.Custom)
        attentionGoodFriednButton.frame = CGRectMake(0, 0, 30, 30)
        attentionGoodFriednButton.setImage(UIImage(named: "navigationbar_friendattention"), forState: UIControlState.Normal)
        attentionGoodFriednButton.setImage(UIImage(named: "navigationbar_friendattention_highlighted"), forState: UIControlState.Highlighted)
        attentionGoodFriednButton.addTarget(self, action: "attentionGoodFriendButtonOnClick:", forControlEvents: UIControlEvents.TouchUpInside)
        let attentionGoodFriendButtonItem = UIBarButtonItem(customView: attentionGoodFriednButton)
        //用于消除左边空隙，要不然按钮顶不到最前面
        let spacerButton = UIBarButtonItem(barButtonSystemItem: .FixedSpace, target: nil,
            action: nil)
        spacerButton.width = -10;
        self.navigationItem.leftBarButtonItems = [spacerButton, attentionGoodFriendButtonItem]
        
        // 创建右边的 添加好友按钮
        let addGoodFriednButton = UIButton(type: UIButtonType.Custom)
        addGoodFriednButton.frame = CGRectMake(10, 0, 30, 30)
        addGoodFriednButton.setImage(UIImage(named: "navigationbar_icon_radar"), forState: UIControlState.Normal)
        addGoodFriednButton.setImage(UIImage(named: "navigationbar_icon_radar_highlighted"), forState: UIControlState.Highlighted)
        addGoodFriednButton.addTarget(self, action: "addGoodFriendButtonOnClick:", forControlEvents: UIControlEvents.TouchUpInside)
        let addGoodFriendButtonItem = UIBarButtonItem(customView: addGoodFriednButton)
        //用于消除左边空隙，要不然按钮顶不到最前面
        let spacerButton1 = UIBarButtonItem(barButtonSystemItem: .FixedSpace, target: nil,
            action: nil)
        spacerButton1.width = -10;
        self.navigationItem.rightBarButtonItems = [spacerButton1, addGoodFriendButtonItem]

        
//        let titleButton = UIButton(type: UIButtonType.Custom)
//        titleButton.frame = CGRectMake(0, -20, 100, 10)
//        titleButton.setTitle("施文松", forState: UIControlState.Normal)
//        titleButton.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
//        titleButton.setImage(UIImage(named: "navigationbar_city_dark"), forState: UIControlState.Normal) 
//        let centerPoint = (self.navigationController?.navigationBar.center)!
//        titleButton.center = centerPoint
//        self.navigationController?.navigationBar.backgroundColor = UIColor.greenColor()
//        self.navigationController?.navigationBar.addSubview(titleButton)
        
        
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
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Protocol Group
    //MARK: - UITableViewDataSource
    //MARK: - UITableViewDelegate
    //MARK: - UIResponder
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
//        Network.request("GET", url: "http://pitayaswift.sinaapp.com/pitaya.php", params: ["get": "Network", "name": "shiwensong"]) { (data, response, error) -> Void in
//            let string = NSString(data: data, encoding: NSUTF8StringEncoding)
//            print(string)
//        }
        
//        Network.request("POST", url: "http://pitayaswift.sinaapp.com/pitaya.php", params: ["post": "Network"]) { (data, response, error) -> Void in
//            let string = NSString(data: data, encoding: NSUTF8StringEncoding)
//            println(string)
//        }
        
        Network.request("POST", url: "http://pitayaswift.sinapp.com/pitaya.php", params:["post" : "Network"]){
            (data, response, error) -> Void in
            let string = NSString(data: data!, encoding: NSUTF8StringEncoding)
            print(string)
        }
        
    }
    
    //MARK: - IBAction

    func attentionGoodFriendButtonOnClick(button: UIButton) {
        
        let attentionGoodFriendViewController = AttentionGoodFriendViewController()
        attentionGoodFriendViewController.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(attentionGoodFriendViewController, animated: true)
    }
    
    func addGoodFriendButtonOnClick(button: UIButton) {
        print("点击了添加好友的按钮")
    }
    
    //MARK: - Private
    //MARK: - Custom

    
    
    func escape(string: String) -> String {
        let generalDelimitersToEncode = ":#[]@" // does not include "?" or "/" due to RFC 3986 - Section 3.4
        let subDelimitersToEncode = "!$&'()*+,;="
        
        let allowedCharacterSet = NSCharacterSet.URLQueryAllowedCharacterSet().mutableCopy() as! NSMutableCharacterSet
        allowedCharacterSet.removeCharactersInString(generalDelimitersToEncode + subDelimitersToEncode)
        
        return string.stringByAddingPercentEncodingWithAllowedCharacters(allowedCharacterSet) ?? ""
    }
    
}