//
//  SinglePhotoViewController.swift
//  Photos
//
//  Created by Kenneth Lam on 4/12/16.
//  Copyright © 2016 iOS DeCal. All rights reserved.
//

import UIKit
import Foundation

class SinglePhotoViewController: UIViewController {
    
    @IBOutlet var imageView : UIImageView!
    @IBOutlet var username : UILabel!
    @IBOutlet var date : UILabel!
    @IBOutlet var likes : UILabel!
    @IBOutlet var heart : UIButton!
    
    var singlePhoto : Photo!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        let photoDate = NSDate(timeIntervalSince1970: Double(singlePhoto.date)!)
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dateString = dateFormatter.stringFromDate(photoDate)
        
        imageView.image = singlePhoto.image
        username.text = "Username: " + singlePhoto.username
        date.text = "Date Posted: " + dateString
        likes.text = "Likes: " + String(singlePhoto.likes)
        heart.frame = CGRectMake(0, 0, 10, 10)
        heart.addTarget(self, action: "heartTap", forControlEvents:.TouchUpInside)
        
        if (!singlePhoto.heartFlip) {
            heart.setImage(UIImage(named: "empty-heart"), forState: .Normal)
        } else {
            heart.setImage(UIImage(named: "full-heart"), forState: .Normal)
        }
        
        username.font = UIFont(name: "Baskerville-SemiBold", size: 18)
        date.font = UIFont(name: "Baskerville-SemiBold", size: 18)
        likes.font = UIFont(name: "Baskerville-SemiBold", size: 18)
        
    }
    
    func heartTap() {
        if (!singlePhoto.heartFlip) {
            singlePhoto.heartFlip = true
            heart.setImage(UIImage(named: "full-heart"), forState: .Normal)
            singlePhoto.likes = singlePhoto.likes + 1
            likes.text = "Likes: " + String(singlePhoto.likes)
        } else {
            singlePhoto.heartFlip = false
            heart.setImage(UIImage(named: "empty-heart"), forState: .Normal)
            singlePhoto.likes = singlePhoto.likes - 1
            likes.text = "Likes: " + String(singlePhoto.likes)
        }
    }
    
}
