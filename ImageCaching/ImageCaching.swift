//
//  ImageCaching.swift
//  ImageCachingFramework
//
//  Created by Nawal Ahmed on 1/18/21.
//

import Foundation
import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()

public class ImageCaching {
    public init() {}
    public func log(message: String) {
        print("Log message: ", message)
    }
}
extension UIImageView  {
    
    public func imageFromServerURL(urlString:  String,tableView:UITableView? = nil,indexpath:IndexPath?  = nil) {
        
        var imageURLString : String?
        
        imageURLString = urlString
        
        if let url = URL(string: urlString) {
            
            image = nil

            if let imageFromCache = imageCache.object(forKey: urlString as AnyObject) as? UIImage {

                self.image =  imageFromCache
                
                return
            }
            
            URLSession.shared.dataTask(with:  url, completionHandler: { (data, response, error) in
                
                if error != nil{
                    
                    print(error as Any)
                    return
                    
                }
                DispatchQueue.main.async(execute:  {
                 
                    if  let imgaeToCache = UIImage(data: data!){
                  
                        if imageURLString == urlString {
                            
                            self.image = imgaeToCache
                            
                        }
                        imageCache.setObject(imgaeToCache, forKey: urlString as  AnyObject)
                        
                        }
                })
                
            }) .resume()
        }
    }
}
