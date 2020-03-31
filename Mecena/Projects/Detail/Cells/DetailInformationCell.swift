//
//  DetailInformationCell.swift
//  Mecena
//
//  Created by Giovanny Orozco Loaiza on 31/03/20.
//  Copyright © 2020 pjic. All rights reserved.
//

import UIKit

class DetailInformationCell: UITableViewCell {

    @IBOutlet private var valueLabels: [UILabel]!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    func setupView(with project: Project) {
        
        valueLabels.enumerated().forEach { (index, label) in
            switch index {
            case 0:
                label.text = project.productName
            case 1:
                label.text = "30 Dias"
            case 2:
                label.text = String(project.totalDonators)
            case 3:
                label.text = project.totalFoundedFormatted
            case 4:
                label.text = project.totalNeededFormatted
            default:
                break
            }
        }
    }
}
