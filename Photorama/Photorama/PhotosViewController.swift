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
            case let .Failure(error):
                print("Error fetching recent photos: \(error)")
            
            }
        }
    }
    
}
