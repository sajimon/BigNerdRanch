//
//  Photo.swift
//  Photorama
//
//  Created by Marcin Sporysz on 16/08/16.
//  Copyright © 2016 Marcin Sporysz. All rights reserved.
//

import UIKit

class Photo {
    let title: String
    let remoteURL: NSURL
    let photoID: String
    let dateTaken: NSDate
    var image: UIImage?
    
    
    
    init(title: String, remoteURL: NSURL, photoID: String, dateTaken: NSDate) {
        self.title = title
        self.remoteURL = remoteURL
        self.photoID = photoID
        self.dateTaken = dateTaken
    }
    
}

extension Photo: Equatable {}

func == (lhs: Photo, rhs: Photo) -> Bool {
    return lhs.photoID == rhs.photoID
}