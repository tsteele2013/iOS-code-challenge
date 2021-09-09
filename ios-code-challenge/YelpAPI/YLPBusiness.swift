//
//  YelpBusiness.swift
//  ios-code-challenge
//
//  Created by Trevor Steele on 9/2/21.
//  Copyright © 2021 Dustin Lange. All rights reserved.
//

import Foundation

@objc class YLPBusiness: NSObject {
    
    var identifier: String
    var name: String
    var categories: String
    var thumbnailURL:  String
    var rating: String
    var distance: Double
    var reviewCount: Int
    
    //var thumbnail: UIImage
    
    @objc init(attributes: Dictionary<String, Any>) {
        print(attributes)
        identifier = attributes["id"] as! String
        name = attributes["name"] as! String
        categories = "Cats"
        thumbnailURL = attributes["image_url"] as! String
        distance = attributes["distance"] as! Double
        
        rating = ""
        if let dStr = attributes["rating"] as? String {
            rating = dStr
        } else if let nStr = attributes["rating"] as? NSNumber {
            rating = nStr.stringValue
        }
        if let cats = attributes["categories"] as? [Dictionary<String, Any>] {
            categories = (cats.map{$0["title"] as! String}).joined(separator: ", ")
        }
        reviewCount = attributes["review_count"] as! Int
        super.init()
        
        
    }
    
    
}

//extension YLPSearch {
//    @objc func businessesFromJSONArray(businessesJSON: NSArray) -> NSArray {
//        return []
//    }
//}

//extension YLPBusiness: NXTCellForObjectDelegate {
//    public func cellForObject(for tableView: UITableView!) -> NXTBindingDataForObjectDelegate! {
//        let cell = Bundle.main.loadNibNamed("BusinessCell", owner: self, options: nil)?.first as! BusinessCell
//        cell.
//    }
//    
//    
//    public func estimatedCellHeightForObject(for tableView: UITableView!) -> CGFloat {
//        return 55.0
//    }
//    
//    
//}

//if(!cell) {
//        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([BusinessCell class])
//                                              owner:nil
//                                            options:nil] firstObject];
//    }
