//
//  SuccessDonationCell.swift
//  Mecena
//
//  Created by Giovanny Orozco Loaiza on 8/05/20.
//  Copyright © 2020 pjic. All rights reserved.
//

import UIKit

protocol SuccessDonationCellDelegate: class {
    func successDonationCellDidSelectExploreMoreProjects(_ cell: SuccessDonationCell)
}

class SuccessDonationCell: UITableViewCell {

    @IBOutlet private weak var messageLabel: UILabel!
    
    weak var delegate: SuccessDonationCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    func setupView(with projectTitle: String, donation: Donation) {
        messageLabel.text = "Ahora eres parte del proyecto \(projectTitle) con una contribución de \(donation.valueFormatted) y estas ayudando a este emprendedor a ser su sueño realidad y por ser parte de esta iniciativa recibes el beneficio (\(donation.title)) como incentivo por tu apoyo."
    }
    
    @IBAction func exploreMoreProjects() {
        delegate?.successDonationCellDidSelectExploreMoreProjects(self)
    }
}
