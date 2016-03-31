//
//  AppDelegate.swift
//  Swift_demo
//
//  Created by NetClue on 16/3/22.
//  Copyright © 2016年 Shiwensong. All rights reserved.
//

import UIKit
import Alamofire


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let tabViewController = BaseTabBarController()

    //MARK: - LifeCycle
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        let viewController = OAuth2Authorize()
        viewController.title = "微博授权"
        self.window?.rootViewController = viewController;
        
        
        
        
        // 一下内容暂时保留
//        let firstVC  = HomeViewController ()
//        let item1 : UITabBarItem = UITabBarItem (title: "首页", image: UIImage(named: "tabbar_home"), selectedImage: UIImage(named: "tabbar_home_selected"))
//        firstVC.tabBarItem = item1
//        let firstNav = BaseNavigationController(rootViewController: firstVC)
//        firstNav.title = "首页"
//        
//        
//        let secondVC = MessageViewController ()
//        let item2 : UITabBarItem = UITabBarItem (title: "消息", image: UIImage(named: "tabbar_message_center"), selectedImage: UIImage(named: "tabbar_message_center_selected"))
//        secondVC.tabBarItem = item2
//        secondVC.title = "消息"
//        let secondNav = BaseNavigationController(rootViewController: secondVC)
//        secondNav.title = "消息"
//        
//        
//        let thirdVC = DiscoverViewController ()
//        let item3 : UITabBarItem = UITabBarItem (title: "发现", image: UIImage(named: "tabbar_discover"), selectedImage: UIImage(named: "tabbar_discover_selected"))
//        thirdVC.tabBarItem = item3
//        thirdVC.title = "发现"
//        let thirdNav = BaseNavigationController(rootViewController: thirdVC)
//        thirdNav.title = "发现"
//        
//        
//        let fourVC = MineViewController ()
//        let item4 : UITabBarItem = UITabBarItem (title: "我", image: UIImage(named: "tabbar_profile"), selectedImage: UIImage(named: "tabbar_profile_selected"))
//        fourVC.tabBarItem = item4
//        fourVC.title = "我"
//        let fourNav = BaseNavigationController(rootViewController: fourVC)
//        fourNav.title = "我"
//        
//        
//        let centerVC = UIViewController()
//        let centerNav = BaseNavigationController(rootViewController: centerVC)
//        centerNav.title = ""
//        
//        
//
//        let tabArray = [firstNav, secondNav, centerNav, thirdNav, fourNav]
//        tabViewController.viewControllers = tabArray
//        tabViewController.tabBar.tintColor = UIColor.orangeColor()
//        
//        
//        var centerButton :UIButton? {
//            get {
//                
//                let centerButton1 = UIButton(type: .Custom)
//                // 获取tabBar的x中点
//                let centerX = CGRectGetMidX(tabViewController.tabBar.frame)
//                // 获取tabBar的高度
//                let height = CGRectGetHeight(tabViewController.tabBar.frame)
//                centerButton1.frame = CGRectMake(centerX - 32, (height - 44) / 2, 64, 44)
//                centerButton1.setBackgroundImage(UIImage(named:  "tabbar_compose_button"), forState: .Normal)
//                centerButton1.setBackgroundImage(UIImage(named: "tabbar_compose_button_highlighted"), forState: .Highlighted)
//                centerButton1.setImage(UIImage(named: "tabbar_compose_icon_add"), forState: .Normal)
//                centerButton1.addTarget(self, action: Selector("centerButtonAction"), forControlEvents: UIControlEvents.TouchUpInside)
//                
//                return centerButton1
//            }
//            set {
//                
//            }
//        }
//        
//        tabViewController.tabBar.addSubview(centerButton!)
//        
//        self.window?.rootViewController = tabViewController
        
//        self.window?.makeKeyAndVisible()
        
        // oauth2 认证
//        let oauthViewController = OAuth2Authorize()
//        self.window?.rootViewController = oauthViewController
        
        
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    
    //MARK: - UIResponder
    
    func centerButtonAction() {
        
        let senderVC = SenderViewController()
        let senderNav = BaseNavigationController(rootViewController: senderVC)
        senderNav.title = "发微博"
        tabViewController.presentViewController(senderNav, animated: true, completion: nil)
    }
    
    
    //MARK: - Private
    
    func setDefaultSetting() {
        
        // Bar's background color
        UINavigationBar.appearance().barTintColor = UIColor.grayColor()
        
        // Back button and such
        UINavigationBar.appearance().tintColor = UIColor.whiteColor()
        
        // Title's text color
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName:UIColor.redColor()]
    }
    

}

