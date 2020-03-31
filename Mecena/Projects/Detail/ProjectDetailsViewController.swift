//
//  ProjectDetailsViewController.swift
//  Mecena
//
//  Created by Giovanny Orozco Loaiza on 30/03/20.
//  Copyright © 2020 pjic. All rights reserved.
//

import UIKit

enum ProjectDetailSection: Int, CaseIterable {
    case header
    case description
    case options
}

class ProjectDetailsViewController: UIViewController {

    @IBOutlet private weak var projectTableView: UITableView!
    
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
        projectTableView.registerCell(HeaderInformationCell.self)
        projectTableView.registerCell(DetailInformationCell.self)
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
        return ProjectDetailSection.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == ProjectDetailSection.options.rawValue {
            return project.donationOptions.count
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let section = ProjectDetailSection(rawValue: indexPath.section) else {
            return UITableViewCell()
        }
        
        switch section {
        case .header:
            let cell: HeaderInformationCell = tableView.dequeueCell(at: indexPath)
            cell.setupView(with: project)
            return cell
        case .description:
            let cell: DetailInformationCell = tableView.dequeueCell(at: indexPath)
            cell.setupView(with: project)
            return cell
        case .options:
            let option = project.donationOptions[indexPath.row]
            let cell: DonationOptionCell = tableView.dequeueCell(at: indexPath)
            cell.setupView(with: option)
            return cell
        }
    }
}
