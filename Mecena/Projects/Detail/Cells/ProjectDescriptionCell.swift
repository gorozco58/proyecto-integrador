//
//  ProjectDescriptionCell.swift
//  Mecena
//
//  Created by Giovanny Orozco Loaiza on 30/03/20.
//  Copyright © 2020 pjic. All rights reserved.
//

import UIKit

class ProjectDescriptionCell: UITableViewCell {

    @IBOutlet private weak var projectImageView: UIImageView!
    @IBOutlet private weak var ownerImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var progressView: UIProgressView!
    @IBOutlet private weak var totalNeededLabel: UILabel!
    @IBOutlet private weak var daysRemainingLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        progressView.layer.borderColor = UIColor.borderGray.cgColor
        progressView.layer.borderWidth = 1
        progressView.layer.cornerRadius = 4
        progressView.layer.masksToBounds = true
    }

    func setupView(with project: Project) {
        projectImageView.af.setImage(withURL: project.projectImageUrl, placeholderImage: nil)
        ownerImageView.af.setImage(withURL: project.ownerImageUrl)
        titleLabel.text = project.title
        descriptionLabel.text = project.description
        progressView.setProgress(Float(project.progress), animated: false)
        totalNeededLabel.text = project.totalNeededFormatted
        totalFoundedLabel.text = project.totalFoundedFormatted
        daysRemainingLabel.text = String(project.daysRemaining)
        
        defaultDonationButtons.enumerated().forEach { (index, button) in
            button.setTitle(project.defaultDonationsFormatted[index], for: .normal)
        }
    }
    
}
