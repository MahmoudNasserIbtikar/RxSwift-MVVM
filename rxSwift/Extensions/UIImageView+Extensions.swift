//
//  UIImageView+Extensions.swift
//  mallers
//
//  Created by Mahmoud Nasser on 5/9/20.
//  Copyright © 2020 Mahmoud Nasser. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

extension UIImageView {
    
    func setImage(with imageModel: String, placeholderImage: UIImage ) {
        if let imageUrl = URL(string: imageModel) {
            self.sd_setImage(
                with: imageUrl,
                placeholderImage: placeholderImage)
        } else {
            self.image = placeholderImage
        }
    }
    
    func tentImageColor(color: UIColor) {
        self.image = self.image?.withRenderingMode(.alwaysTemplate)
        self.tintColor = color
    }
}
