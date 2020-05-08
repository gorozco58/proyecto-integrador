//
//  ProjectsListViewController.swift
//  Mecena
//
//  Created by Giovanny Orozco Loaiza on 12/03/20.
//  Copyright © 2020 pjic. All rights reserved.
//

import UIKit

class ProjectsListViewController: UIViewController {
    
    @IBOutlet private weak var projectsTableView: UITableView!
    private var projects = ProjectsManager.shared.explorableProjects
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        reloadData()
    }
}

//MARK: - Private methods
private extension ProjectsListViewController {
    
    func setupTableView() {
        projectsTableView.registerCell(ProjectCell.self)
        projectsTableView.dataSource = self
        projectsTableView.delegate = self
        projectsTableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
        projectsTableView.rowHeight = UITableView.automaticDimension
        projectsTableView.estimatedRowHeight = 400
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    func reloadData() {
        projects = ProjectsManager.shared.explorableProjects
        projectsTableView.reloadData()
    }
}

//MARK: - UITableViewDelegate
extension ProjectsListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return projects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let project = projects[indexPath.row]
        let cell: ProjectCell = tableView.dequeueCell(at: indexPath)
        cell.setupView(with: project)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let project = projects[indexPath.row]
        let viewController = ProjectDetailsViewController(project: project)
        navigationController?.pushViewController(viewController, animated: true)
    }
}
