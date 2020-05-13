//
//  ProfileImageCell.swift
//  Mecena
//
//  Created by Giovanny Orozco Loaiza on 13/05/20.
//  Copyright © 2020 pjic. All rights reserved.
//

import UIKit
import AlamofireImage

class ProfileImageCell: UITableViewCell {

    @IBOutlet private weak var profileiImageView: UIImageView!
    
    func setupView(with imageUrl: URL) {
        profileiImageView.af.setImage(withURL: imageUrl)
    }
}
