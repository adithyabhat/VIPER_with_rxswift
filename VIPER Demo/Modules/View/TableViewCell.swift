//
//  TableViewCell.swift
//  VIPER Demo
//
//  Created by Adithya hayagreeva on 5/26/20.
//  Copyright © 2020 Emirates NBD. All rights reserved.
//

import UIKit
import SDWebImage

class TableViewCell: UITableViewCell {

    @IBOutlet weak var contentImageView: UIImageView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        contentImageView.image = nil
        contentImageView.sd_cancelCurrentImageLoad()
    }
    
    func configure(imageURL: URL) {
        contentImageView.sd_setImage(with: imageURL,
                                     placeholderImage: #imageLiteral(resourceName: "placeholder-image"),
                                     options: .forceTransition,
                                     completed: nil)
    }
}
