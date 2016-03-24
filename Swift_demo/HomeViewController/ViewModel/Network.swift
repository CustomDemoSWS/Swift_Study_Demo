//
//  Network.swift
//  Swift_demo
//
//  Created by NetClue on 16/3/24.
//  Copyright © 2016年 Shiwensong. All rights reserved.
//

import Foundation

class Network{
    
    //施文松
    static func request1(method: String, url: String, params: Dictionary<String, AnyObject> = Dictionary<String, AnyObject>(), callback:(data: NSData!, response: NSURLResponse!, error: NSError!) -> Void){
        
        let session = NSURLSession.sharedSession()
        
        var newURL = url
        if method == "GET" {
            newURL += "?" + Network().buildParams(params)

        }
        
        let request = NSMutableURLRequest(URL: NSURL(string: newURL)!)
        request.HTTPMethod = method
        let task = session.dataTaskWithRequest(request) { (data , response, error)  -> Void in
            callback(data: data, response: response, error: error)
        }
        task.resume()
        
    }
    
    
    static func request(method: String, url: String, params: Dictionary<String, AnyObject> = Dictionary<String, AnyObject>(), callback: (data: NSData!, response: NSURLResponse!, error: NSError!) -> Void) {
        let session = NSURLSession.sharedSession()
        
        var newURL = url
        if method == "GET" {
            newURL += "?" + Network().buildParams(params)
        }
        
        let request = NSMutableURLRequest(URL: NSURL(string: newURL)!)
        request.HTTPMethod = method
        
        let task = session.dataTaskWithRequest(request, completionHandler: { (data, response, error) -> Void in
            callback(data: data, response: response , error: error)
        })
        task.resume()
    }
    
    
    // 施文松
    func buildParams1(parameters: [String: AnyObject]) -> String {
        var components: [(String, String)] = []
        for key in Array(parameters.keys).sort(<) {
            let value: AnyObject! = parameters[key]
            components += self.queryComponents(key, value)
        }
        return (components.map{"\($0)=\($1)"} as [String]).joinWithSeparator("&")
    }
    
    
    
    // 从 Alamofire 偷了三个函数
    func buildParams(parameters: [String: AnyObject]) -> String {
        var components: [(String, String)] = []
        for key in Array(parameters.keys).sort(<) {
            let value: AnyObject! = parameters[key]
            components += self.queryComponents(key, value)
        }
        
        return (components.map{"\($0)=\($1)"} as [String]).joinWithSeparator("&")
    }
    
    // 施文松
    func queryComponents1(key: String, _ value: AnyObject) -> [(String, String)] {
        
        var components:[(String , String)] = []
        if let dictionary = value as? [String: AnyObject] {
            
            for (nestedKey, value) in dictionary {
                components += queryComponents(("\(key)[\(nestedKey)]"), value)
            }
            
        } else if let array = value as? [AnyObject] {
            
            for value in array {
                components += queryComponents1("\(key)", value)
            }
            
        } else {
           components.appendContentsOf([(escape(key),escape("\(value)"))])
        }
        return components
    }
    
    
    func queryComponents(key: String, _ value: AnyObject) -> [(String, String)] {
        var components: [(String, String)] = []
        if let dictionary = value as? [String: AnyObject] {
            for (nestedKey, value) in dictionary {
                components += queryComponents("\(key)[\(nestedKey)]", value)
            }
        } else if let array = value as? [AnyObject] {
            for value in array {
                components += queryComponents("\(key)", value)
            }
        } else {
            components.appendContentsOf([(escape(key), escape("\(value)"))])
        }
        
        return components
    }
    
    func escape1(string: String) -> String{
        let legalURLCharactersToBeEscaped: CFStringRef = ":&=;+!@#$()',*"
        return CFURLCreateStringByAddingPercentEscapes(nil , string, nil, legalURLCharactersToBeEscaped, CFStringBuiltInEncodings.UTF8.rawValue) as String
    }
    
    func escape(string: String) -> String {
        let legalURLCharactersToBeEscaped: CFStringRef = ":&=;+!@#$()',*"
        return CFURLCreateStringByAddingPercentEscapes(nil, string, nil, legalURLCharactersToBeEscaped, CFStringBuiltInEncodings.UTF8.rawValue) as String
    }

    
    /*****************************************n  POST  *********************************/
    
    static func request3(method: String, url: String, params: Dictionary<String, AnyObject> = Dictionary<String, AnyObject>(), callback: (data: NSData!, response: NSURLResponse!, error: NSError!) -> Void) {
        let session = NSURLSession.sharedSession()
        
        var newURL = url
        if method == "GET" {
            newURL += "?" + Network().buildParams(params)
        }
        
        let request = NSMutableURLRequest(URL: NSURL(string: newURL)!)
        request.HTTPMethod = method
        
        if method == "POST" {
            request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
            request.HTTPBody = Network().buildParams(params).dataUsingEncoding(NSUTF8StringEncoding)
        }
        
        let task = session.dataTaskWithRequest(request, completionHandler: { (data, response, error) -> Void in
            callback(data: data, response: response , error: error)
        })
        task.resume()
    }
    
}
