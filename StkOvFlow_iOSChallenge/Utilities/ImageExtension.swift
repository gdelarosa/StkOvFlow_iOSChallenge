//
//  ImageExtension.swift
//  StkOvFlow_iOSChallenge
//
//  Created by Gina De La Rosa on 7/12/18.
//  Copyright © 2018 Gina De La Rosa. All rights reserved.
//  Using NSCache to temporarily store images

import Foundation
import UIKit

fileprivate let imageCache = NSCache<NSString, UIImage>()

extension UIImageView {
    func loadImage(urlString: String) {
        if let imageFromCache = imageCache.object(forKey: urlString as NSString) {
            self.image = imageFromCache
            return
        }
        if let url = URL(string: urlString as String) {
            DispatchQueue.global().async { [weak self] in
                if let data = try? Data(contentsOf: url) {
                    if let image = UIImage(data: data) {
                        imageCache.setObject(image, forKey: urlString as NSString)
                        DispatchQueue.main.async {
                            self?.image = image
                        }
                    }
                }
            }
        }
    }
    
    func showUnavailableImage() {
        self.image = UIImage(named: "unavailable")
    }
}

