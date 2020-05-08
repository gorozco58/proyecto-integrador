//
//  DonatedProjectCell.swift
//  Mecena
//
//  Created by Giovanny Orozco Loaiza on 8/05/20.
//  Copyright © 2020 pjic. All rights reserved.
//

import UIKit
import Alamofire

class DonatedProjectCell: UITableViewCell {

    @IBOutlet private weak var projectImageView: UIImageView!
    @IBOutlet private weak var ownerImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var progressView: UIProgressView!
    @IBOutlet private weak var totalNeededLabel: UILabel!
    @IBOutlet private weak var totalFoundedLabel: UILabel!
    @IBOutlet private weak var daysRemainingLabel: UILabel!
    @IBOutlet private weak var messageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.3
        layer.shadowOffset = .zero
        layer.shadowRadius = 10
        selectionStyle = .none
        progressView.layer.borderColor = UIColor.borderGray.cgColor
        progressView.layer.borderWidth = 1
        progressView.layer.cornerRadius = 4
        progressView.layer.masksToBounds = true
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        projectImageView.image = nil
        ownerImageView.image = nil
    }

    func setupView(with project: Project) {
        guard let donation = project.ownDonation else { return }
        
        projectImageView.af.setImage(withURL: project.projectImageUrl, placeholderImage: UIImage())
        ownerImageView.af.setImage(withURL: project.ownerImageUrl)
        titleLabel.text = project.title
        descriptionLabel.text = project.description
        progressView.setProgress(Float(project.progress), animated: false)
        totalNeededLabel.text = project.totalNeededFormatted
        totalFoundedLabel.text = project.totalFoundedFormatted
        daysRemainingLabel.text = String(project.daysRemaining)
        messageLabel.text = "!Ahora eres Mecena de este proyecto¡ con un aporte de \(donation.valueFormatted) recibiras la \(donation.title)"
    }
}
