//
//  DonationOptionCell.swift
//  Mecena
//
//  Created by Giovanny Orozco Loaiza on 31/03/20.
//  Copyright © 2020 pjic. All rights reserved.
//

import UIKit

class DonationOptionCell: UITableViewCell {

    @IBOutlet private weak var priceLabel: UILabel!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var detailLabel: UILabel!
    @IBOutlet private weak var optionButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setupView(with donation: Donation) {
        priceLabel.text = donation.valueFormatted
        nameLabel.text = donation.title
        detailLabel.text = donation.description
        optionButton.setTitle("Donar \(donation.valueFormatted)", for: .normal)
    }
}
