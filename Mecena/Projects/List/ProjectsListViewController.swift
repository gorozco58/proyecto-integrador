//
//  ProjectsListViewController.swift
//  Mecena
//
//  Created by Giovanny Orozco Loaiza on 12/03/20.
//  Copyright © 2020 pjic. All rights reserved.
//

import UIKit

enum ProjectsSection {
    case main
}

class ProjectsListViewController: UIViewController {
    
    @IBOutlet private weak var projectsTableView: UITableView!
    
    private var dataSource: UITableViewDiffableDataSource<ProjectsSection, Project>!
    
    init() {
        super.init(nibName: String(describing: ProjectsListViewController.self), bundle: nil)
        title = "Descubrir Proyectos"
        tabBarItem = UITabBarItem(title: "Proyectos", image: #imageLiteral(resourceName: "projects-tab-icon").withRenderingMode(.alwaysOriginal), selectedImage: #imageLiteral(resourceName: "projects-tab-icon-selected").withRenderingMode(.alwaysOriginal))
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
private extension ProjectsListViewController {
    
    func setupTableView() {
        dataSource = UITableViewDiffableDataSource<ProjectsSection, Project>(tableView: projectsTableView) { (tableView, indexPath, project) in
            let cell: ProjectCell = tableView.dequeueCell(at: indexPath)
            cell.setupView(with: project)
            return cell
        }
        
        projectsTableView.registerCell(ProjectCell.self)
        projectsTableView.dataSource = dataSource
        projectsTableView.delegate = self
        projectsTableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
        projectsTableView.rowHeight = UITableView.automaticDimension
        projectsTableView.estimatedRowHeight = 400
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        var snapshot = NSDiffableDataSourceSnapshot<ProjectsSection, Project>()
        snapshot.appendSections([.main])
        snapshot.appendItems(ProjectsManager.explorableProjects, toSection: .main)
        dataSource.apply(snapshot, animatingDifferences: false, completion: nil)
    }
}

//MARK: - UITableViewDelegate
extension ProjectsListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let project = dataSource.itemIdentifier(for: indexPath) else { return }
        let viewController = ProjectDetailsViewController(project: project)
        navigationController?.pushViewController(viewController, animated: true)
    }
}
