//
//  PhotosViewController.swift
//  Photorama
//
//  Created by Marcin Sporysz on 16/08/16.
//  Copyright © 2016 Marcin Sporysz. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    var store: PhotoStore!
    
    
    //MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        store.fetchRecentPhotos() {
            (photoResult) -> Void in
            
            switch photoResult {
            case let .Success(photos):
                print("Successfully found \(photos.count) recent photos")
                
                if let firstPhoto = photos.first {
                    self.store.fetchImageForPhoto(firstPhoto) { (imageResult) -> Void in
                        
                        switch imageResult {
                        case let .Success(image):
//                            self.imageView.image = image
                            NSOperationQueue.mainQueue().addOperationWithBlock() { () -> Void in
                                self.imageView.image = image
                            }
                        case let .Failure(error):
                            print("Error downloading image: \(error)")
                        }
                    }
                }
                
            case let .Failure(error):
                print("Error fetching recent photos: \(error)")
            
            }
        }
    }
    
}
