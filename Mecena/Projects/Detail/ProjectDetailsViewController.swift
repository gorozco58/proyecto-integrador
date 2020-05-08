//
//  ProjectDetailsViewController.swift
//  Mecena
//
//  Created by Giovanny Orozco Loaiza on 30/03/20.
//  Copyright © 2020 pjic. All rights reserved.
//

import UIKit

enum ProjectDetailSection {
    case header
    case description
    case successDonation
    case options
}

class ProjectDetailsViewController: UIViewController {

    @IBOutlet private weak var projectTableView: UITableView!
    private var sections: [ProjectDetailSection] = [.header, .description]
    
    private let project: Project
    
    init(project: Project) {
        self.project = project
        super.init(nibName: String(describing: ProjectDetailsViewController.self), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
}

//MARK: - Private methods
private extension ProjectDetailsViewController {
    
    func setupTableView() {
        if project.ownDonation != nil {
            sections.append(.successDonation)
        }
        
        if !project.donationOptions.isEmpty {
            sections.append(.options)
        }
        
        projectTableView.registerCell(HeaderInformationCell.self)
        projectTableView.registerCell(DetailInformationCell.self)
        projectTableView.registerCell(SuccessDonationCell.self)
        projectTableView.registerCell(DonationOptionCell.self)
        projectTableView.dataSource = self
        projectTableView.delegate = self
        projectTableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
        projectTableView.rowHeight = UITableView.automaticDimension
        projectTableView.estimatedRowHeight = 300
    }
}

//MARK: - UITableViewDelegate
extension ProjectDetailsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionType = sections[section]
        
        if sectionType == .options {
            return project.donationOptions.count
        }
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = sections[indexPath.section]
        
        switch section {
        case .header:
            let cell: HeaderInformationCell = tableView.dequeueCell(at: indexPath)
            cell.setupView(with: project)
            return cell
        case .description:
            let cell: DetailInformationCell = tableView.dequeueCell(at: indexPath)
            cell.setupView(with: project)
            return cell
        case .successDonation:
            let cell: SuccessDonationCell = tableView.dequeueCell(at: indexPath)
            cell.delegate = self
            if let donation = project.ownDonation {
                cell.setupView(with: project.title, donation: donation)
            }
            return cell
        case .options:
            let option = project.donationOptions[indexPath.row]
            let cell: DonationOptionCell = tableView.dequeueCell(at: indexPath)
            cell.setupView(with: option)
            cell.delegate = self
            return cell
        }
    }
}

//MARK: - DonationOptionCellDelegate
extension ProjectDetailsViewController: DonationOptionCellDelegate {
    
    func donationOptionCellDidSelectDonation(_ cell: DonationOptionCell, donation: Donation) {
        project.performDonation(donation) 
        let message = "Gracias por creer en este proyecto ahora te haz convertido en Mecena de este proyecto con una donación de \(donation.valueFormatted)"
        let confirmation = ConfirmationViewController(message: message)
        confirmation.delegate = self
        confirmation.modalPresentationStyle = .overCurrentContext
        tabBarController?.present(confirmation, animated: true, completion: nil)
    }
}

//MARK: - ConfirmationViewControllerDelegate
extension ProjectDetailsViewController: ConfirmationViewControllerDelegate {
    
    func dismissViewController(_ viewController: ConfirmationViewController) {
        viewController.dismiss(animated: true) {
            self.tabBarController?.selectedIndex = 1
            self.navigationController?.popViewController(animated: false)
        }
    }
}

//MARK: - SuccessDonationCellDelegate
extension ProjectDetailsViewController: SuccessDonationCellDelegate {
    
    func successDonationCellDidSelectExploreMoreProjects(_ cell: SuccessDonationCell) {
        self.tabBarController?.selectedIndex = 0
    }
}
