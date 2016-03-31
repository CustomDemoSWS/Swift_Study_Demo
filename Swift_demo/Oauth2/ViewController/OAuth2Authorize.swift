//
//  OAuth2Authorize.swift
//  Swift_demo
//
//  Created by NetClue on 16/3/29.
//  Copyright © 2016年 Shiwensong. All rights reserved.
//

import UIKit
import Alamofire

let APPKey = "2709794693"
let AppSecret = "eaa21173a631da4f2dde7f4e549c8ad0"
let APPredirect_uri  = "http://open.weibo.com"

class OAuth2Authorize: BaseViewController, UIWebViewDelegate  {

    var webView:UIWebView {
        
        let webView = UIWebView(frame: UIScreen.mainScreen().bounds)
        self.view.addSubview(webView)
        webView.delegate = self
        return webView
    }

    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.yellowColor()
        
        self.getOauth2Authorize()
        
        
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
    //MARK: - UIWebViewDelegate
    
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        let url = request.URL?.relativeString as! NSString
        print(url)
        let range = (url as NSString).rangeOfString("code=")
        
        if range.location != NSNotFound {
            let tokenString = url.substringFromIndex((range.location + range.length))
            getOauthedToken(tokenString)
        }
        
        
        
//        
//        NSRange range = [url rangeOfString:@"code="];
//        if (range.location != NSNotFound) {
//            
//            NSString *code = [url substringFromIndex:range.location + range.length];
//            NSLog(@"code=%@",code);
//            
//            
//            [self requestToken:code];
//            
//        }

        
        return true
    }
    
    
    func webViewDidStartLoad(webView: UIWebView) {
        

    }
 
    func webViewDidFinishLoad(webView: UIWebView) {
        
    }
    
    func webView(webView: UIWebView, didFailLoadWithError error: NSError?) {
        
        
        
    }
    
    
    
    //MARK: - UIResponder
    //MARK: - Private
    
    /*!
    获取oauth2的认证
    */
    func getOauth2Authorize() {
        
            let urlRequest = NSURLRequest(URL: NSURL(string: "https://api.weibo.com/oauth2/authorize?client_id=2709794693&redirect_uri=http://open.weibo.com")!)
            self.webView.loadRequest(urlRequest)
    }
    
    /*!
    获取授权过后的token
    
    - parameter code: <#code description#>
    */
    func getOauthedToken(code: String) {
    
        var parames = Dictionary<String, String>()
        parames["client_id"] = APPKey
        parames["client_secret"] = AppSecret
        parames["grant_type"] = "authorization_code"
        parames["code"] = code
        parames["redirect_uri"] = APPredirect_uri
        
        Alamofire.request(.POST, "https://api.weibo.com/oauth2/access_token", parameters: parames, encoding: .URL, headers: nil).response { (request, response , data , error ) -> Void in
            
            let dataString = String(data: data!, encoding: NSUTF8StringEncoding)
            print("dataString == \(dataString)")
            print("data == \(data)")
            
            let dict = try? NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers)
            
            
            let tokenModel = TokenModel.initWithDictionary(dict)
            
            print("tokentModel == \(tokenModel)")
            
        }
    }
    
    
    //MARK: - Custom

    
}

