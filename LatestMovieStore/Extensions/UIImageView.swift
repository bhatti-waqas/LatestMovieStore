//
//  UIImageView.swift
//  CareemAssignment
//
//  Created by Waqas Naseem on 06/10/2019.
//  Copyright © 2019 Waqas Naseem. All rights reserved.
//

import UIKit
import SDWebImage

protocol ImageLazyLoading {
    func loadImage(withUrlString urlString:String?,placeholderImage placeholder:UIImage?)
}

extension UIImageView:ImageLazyLoading {
    
    func loadImage(withUrlString urlString: String?, placeholderImage placeholder: UIImage?) {
        image = placeholder
        guard
            let _urlString = urlString,
            let imageURL = URL(string:_urlString)
            else { return }
        sd_setImage(with: imageURL, placeholderImage: placeholder, options: .highPriority, context: .none)
    }
    
}
