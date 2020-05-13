//
//  ProfileInformationCell.swift
//  Mecena
//
//  Created by Giovanny Orozco Loaiza on 13/05/20.
//  Copyright © 2020 pjic. All rights reserved.
//

import UIKit

class ProfileInformationCell: UITableViewCell {

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var valueLabel: UILabel!
    
    func setupView(with title: String, and value: String) {
        titleLabel.text = title
        valueLabel.text = value
    }
}
