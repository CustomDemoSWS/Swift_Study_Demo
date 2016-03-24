//
//  ViewController.swift
//  Swift_demo
//
//  Created by NetClue on 16/3/22.
//  Copyright © 2016年 Shiwensong. All rights reserved.
//


import Foundation
import UIKit



var cellID: String! = "cellID"
var cellID1: String! = "cellID1"

class ViewController: UIViewController ,UITableViewDataSource, UITableViewDelegate {
    
    //刷新
//    let header = MJRefreshNormalHeader()

    
    var tableView:UITableView? {
        get {
            let tableView1 = UITableView(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.size.width, UIScreen.mainScreen().bounds.size.height-44))
            self.view.addSubview(tableView1)
            tableView1.dataSource = self
            tableView1.delegate = self
            
            return tableView1
        }
        
        set {
            
        }
    }
    var imageListArray:NSArray?{
        get {
            let imageArarry = [String]()
            


            return imageArarry
        }
        
        set {
            
        }
    }
    
    //MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.title = "首页"
        self.tableView!.registerClass(SWSTableViewCell.self, forCellReuseIdentifier: cellID1)

        
        
        
        
        
        // 下拉刷新
//        header.setRefreshingTarget(self, refreshingAction: Selector("headerRefresh"))
//        // 现在的版本要用mj_header
//        self.tableView!.mj_header = header
        
//        
//        let button = UIButton(type: .ContactAdd)
//        button.frame = CGRectMake(0, 0, 100, 50)
//        button.setTitle("按钮", forState: .Normal)
//        button.setTitleColor(UIColor.redColor(), forState: .Normal)
//        
//        button.addTarget(self, action: Selector("buttonOnClick:"), forControlEvents: .TouchUpInside)
        
//        func buttonOnClick(button: UIButton){
//            if !self.tableView!.mj_header.isRefreshing() {
//                self.tableView!.mj_header.endRefreshing()
//            }
//        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - Protocol Group
    //MARK: - UITableViewDataSource
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        var cell: UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(cellID)
//    
//        if cell == nil {
//            cell = UITableViewCell(style: .Default, reuseIdentifier: cellID)
//        }
//        
//        cell!.textLabel?.text = "\(indexPath.section) --- \(indexPath.row) "

        let cell = tableView.dequeueReusableCellWithIdentifier(cellID1) as! SWSTableViewCell
        cell.selectionStyle = .None
        
        
        
        cell.cellTitle!.text = "shiwensong"
        
        cell.cellImageView!.sd_setImageWithURL(NSURL(string: "http://img.ph.126.net/oMinqUGcd0Y0iioBzMifHw==/3355744672344806392.jpg"), placeholderImage: UIImage(named: "4.png"))

        
        return cell
    }
    
    //MARK: - UITableViewDelegate
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return 80
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let detailViewController = DetailViewController()
        detailViewController.number = indexPath.row
        self.navigationController?.pushViewController(detailViewController, animated: true)
        
    }
    
    
    //MARK: - UIResponder
    //MARK: - Private
    
    //MARK: - Custom
    
    
    
}

