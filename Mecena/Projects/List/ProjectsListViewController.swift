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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        var snapshot = NSDiffableDataSourceSnapshot<ProjectsSection, Project>()
        snapshot.appendSections([.main])
        snapshot.appendItems(createProjects(), toSection: .main)
        dataSource.apply(snapshot, animatingDifferences: false, completion: nil)
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
        projectsTableView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
        projectsTableView.rowHeight = UITableView.automaticDimension
        projectsTableView.estimatedRowHeight = 400
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        hidesBottomBarWhenPushed = true
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


func createProjects() -> [Project] {
    return [
        Project(identifier: 001,
                projectImageUrl: URL(string: "https://www.infobae.com/new-resizer/0fHpcptQbngvBpr7zmo534H4kdQ=/750x0/filters:quality(100)/arc-anglerfish-arc2-prod-infobae.s3.amazonaws.com/public/AMJR4SHSORGFFE7GP2G4L2WFNI.jpg")!,
                ownerImageUrl: URL(string: "https://images.pexels.com/users/avatars/312707/rob-eradus-859.jpeg?w=256&h=256&fit=crop&crop=faces&auto=compress")!,
                title: "Acerca de esta causa",
                description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                totalNeeded: 5000000,
                totalFounded: 1230000,
                totalDonators: 15,
                creationDate: Date().addingTimeInterval(-14*24*60*60)),
        
        Project(identifier: 002,
                projectImageUrl: URL(string: "https://images-na.ssl-images-amazon.com/images/I/91aytxohJ8L._AC_SX522_.jpg")!,
                ownerImageUrl: URL(string: "https://i.imgur.com/MyFbXA0.jpg")!,
                title: "Acerca de esta causa",
                description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                totalNeeded: 1250000,
                totalFounded: 320000,
                totalDonators: 4,
                creationDate: Date().addingTimeInterval(-22*24*60*60)),
        
        Project(identifier: 003,
                projectImageUrl: URL(string: "https://www.thomann.de/pics/bdb/417400/12233212_800.jpg")!,
                ownerImageUrl: URL(string: "https://i.imgur.com/dSJvdtu.jpg")!,
                title: "Acerca de esta causa",
                description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                totalNeeded: 15000000,
                totalFounded: 12560000,
                totalDonators: 87,
                creationDate: Date().addingTimeInterval(-9*24*60*60)),
        
        Project(identifier: 004,
                projectImageUrl: URL(string: "https://cdn.pocket-lint.com/r/s/970x/assets/images/146175-laptops-review-review-apple-macbook-air-2018-review-image1-ek7ftjzqkb-jpg.webp")!,
                ownerImageUrl: URL(string: "https://i.imgur.com/MxdQ502.jpg")!,
                title: "Acerca de esta causa",
                description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                totalNeeded: 8700000,
                totalFounded: 1200000,
                totalDonators: 2,
                creationDate: Date().addingTimeInterval(-30*24*60*60)),
        
        Project(identifier: 005,
                projectImageUrl: URL(string: "https://images.squarespace-cdn.com/content/v1/580fe82c3e00bed107744d7e/1516045756443-9T5LQA4V0N1ID44WOXGO/ke17ZwdGBToddI8pDm48kNCH0IFo-E28D0rm_d_wnF4UqsxRUqqbr1mOJYKfIPR7LoDQ9mXPOjoJoqy81S2I8N_N4V1vUb5AoIIIbLZhVYxCRW4BPu10St3TBAUQYVKczdH3qUBwO6oWXP_OkYMa5KbLFw5Om5Yp_Nt25Y6nc5ZZuUUY1FOqARMqv9i1pcqr/HOME%2BBURGER%2B2-9.jpg")!,
                ownerImageUrl: URL(string: "https://res-5.cloudinary.com/crunchbase-production/image/upload/c_thumb,h_256,w_256,f_auto,g_faces,z_0.7,q_auto:eco/v1485245367/jl2h7qypjro92wvskkav.jpg")!,
                title: "Acerca de esta causa",
                description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                totalNeeded: 2000000,
                totalFounded: 540000,
                totalDonators: 7,
                creationDate: Date().addingTimeInterval(-2*24*60*60)),
        
        Project(identifier: 006,
                projectImageUrl: URL(string: "https://9to5google.com/wp-content/uploads/sites/4/2016/11/google-home-picture.jpeg?quality=82&strip=all&w=1600")!,
                ownerImageUrl: URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcS2W5z8jgMXbjTnmPxW6rPp4yCYwCbZvzcI23T0u1Bjteulxz67")!,
                title: "Acerca de esta causa",
                description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                totalNeeded: 32000000,
                totalFounded: 18760000,
                totalDonators: 125,
                creationDate: Date().addingTimeInterval(-17*24*60*60)),
        
        Project(identifier: 007,
                projectImageUrl: URL(string: "https://www.bccourier.com/wp-content/uploads/2020/03/Home-Building-Software-Market-1.jpg")!,
                ownerImageUrl: URL(string: "https://michelkraemer.com/images/michel-kraemer-2019-09-256x256.jpg")!,
                title: "Acerca de esta causa",
                description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                totalNeeded: 4300000,
                totalFounded: 0,
                totalDonators: 0,
                creationDate: Date().addingTimeInterval(-29*24*60*60)),
        
        Project(identifier: 008,
                projectImageUrl: URL(string: "https://i.blogs.es/e9a1b3/zarahome_64698012_1172845126250248_4654365072102599584_n/450_1000.jpeg")!,
                ownerImageUrl: URL(string: "https://images.pexels.com/users/avatars/225090/diego-cano-373.png?w=256&h=256&fit=crop&crop=faces&auto=compress")!,
                title: "Acerca de esta causa",
                description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                totalNeeded: 7900000,
                totalFounded: 7400000,
                totalDonators: 45,
                creationDate: Date().addingTimeInterval(-9*24*60*60)),
        
        Project(identifier: 009,
                projectImageUrl: URL(string: "https://elcomercio.pe/resizer/L2Iz6kNH-9yzsIK_jJ2EjKYMfuc=/980x528/smart/arc-anglerfish-arc2-prod-elcomercio.s3.amazonaws.com/public/GZJ3BJIBEJH7HMUILEQVBLT46A.jpg")!,
                ownerImageUrl: URL(string: "https://www.internations.org/go/build/images/default/endorsement/avatar-3.1763ca66f7397a7f6a7ce8d7057e303f-256.jpg")!,
                title: "Acerca de esta causa",
                description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                totalNeeded: 56000000,
                totalFounded: 37650000,
                totalDonators: 329,
                creationDate: Date().addingTimeInterval(-16*24*60*60)),
        
        Project(identifier: 010,
                projectImageUrl: URL(string: "https://lh3.googleusercontent.com/proxy/SCRr2h-U7wVuHkK9B49Lv1Tu6svtgkyVCr484ZiNKHUCv5cuRqM71sXBxXgamyxqfW2XEQWKstukjka0ig4_cA-oRnJk4PZsqtqHm9h4WDM")!,
                ownerImageUrl: URL(string: "https://i.insider.com/53f1ffd96bb3f798431c5fb5?width=500&format=jpeg&auto=webp")!,
                title: "Acerca de esta causa",
                description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                totalNeeded: 14800000,
                totalFounded: 6700000,
                totalDonators: 98,
                creationDate: Date().addingTimeInterval(-24*24*60*60)),
        
        Project(identifier: 011,
                projectImageUrl: URL(string: "https://www.lifeinnorway.net/wp-content/uploads/2020/03/person-in-home-quarantine-infection.jpg")!,
                ownerImageUrl: URL(string: "https://openexpoeurope.com/wp-content/uploads/2017/05/thomas-person.jpg")!,
                title: "Acerca de esta causa",
                description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                totalNeeded: 3500000,
                totalFounded: 1340000,
                totalDonators: 25,
                creationDate: Date().addingTimeInterval(-27*24*60*60)),
        
        Project(identifier: 012,
                projectImageUrl: URL(string: "https://specials-images.forbesimg.com/imageserve/1149030074/960x0.jpg?fit=scale")!,
                ownerImageUrl: URL(string: "https://res-3.cloudinary.com/crunchbase-production/image/upload/c_thumb,h_256,w_256,f_auto,g_faces,z_0.7,q_auto:eco/v1491330465/ryi3o6nlet3kwgylbych.png")!,
                title: "Acerca de esta causa",
                description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                totalNeeded: 10990000,
                totalFounded: 5600000,
                totalDonators: 18,
                creationDate: Date().addingTimeInterval(-5*24*60*60)),
    ]
}
