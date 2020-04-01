//
//  DonationOptionCell.swift
//  Mecena
//
//  Created by Giovanny Orozco Loaiza on 31/03/20.
//  Copyright © 2020 pjic. All rights reserved.
//

import UIKit

protocol DonationOptionCellDelegate: class {
    func donationOptionCellDidSelectDonation(_ cell: DonationOptionCell, donation: Donation)
}

class DonationOptionCell: UITableViewCell {

    @IBOutlet private weak var priceLabel: UILabel!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var detailLabel: UILabel!
    @IBOutlet private weak var optionButton: UIButton!
    
    weak var delegate: DonationOptionCellDelegate?
    private var donation: Donation?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    func setupView(with donation: Donation) {
        self.donation = donation
        priceLabel.text = donation.valueFormatted
        nameLabel.text = donation.title
        detailLabel.text = donation.description
        optionButton.setTitle("Donar \(donation.valueFormatted)", for: .normal)
    }
    
    @IBAction func buttonSelected() {
        guard let delegate = delegate, let donation = donation else { return }
        delegate.donationOptionCellDidSelectDonation(self, donation: donation)
    }
}
