//
//  ProfileViewController.swift
//  Mecena
//
//  Created by Giovanny Orozco Loaiza on 12/03/20.
//  Copyright © 2020 pjic. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet private weak var profileTableView: UITableView!
    
    private let user: User
    
    init() {
        user = User(imageUrl: URL(string: "https://res-5.cloudinary.com/crunchbase-production/image/upload/c_thumb,h_256,w_256,f_auto,g_faces,z_0.7,q_auto:eco/v1485245367/jl2h7qypjro92wvskkav.jpg")!,
                    name: "Giovanny",
                    lastName: "Orozco Loaiza",
                    mail: "giovannyorozco24@gmail.com",
                    phone: "+57 3116050267",
                    gender: .male)
        super.init(nibName: String(describing: ProfileViewController.self), bundle: nil)
        title = "Perfil"
        tabBarItem = UITabBarItem(title: "Perfil", image: #imageLiteral(resourceName: "profile-tab-icon").withRenderingMode(.alwaysOriginal), selectedImage: #imageLiteral(resourceName: "profile-tab-icon-selected").withRenderingMode(.alwaysOriginal))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileTableView.registerCell(ProfileImageCell.self)
        profileTableView.registerCell(ProfileInformationCell.self)
        profileTableView.registerCell(ProfileButtonCell.self)
        profileTableView.dataSource = self
        profileTableView.delegate = self
    }
}

//MARK: - UITableViewDataSource
extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell: ProfileImageCell = tableView.dequeueCell(at: indexPath)
            cell.setupView(with: user.imageUrl)
            return cell
        case 1:
            let cell: ProfileInformationCell = tableView.dequeueCell(at: indexPath)
            cell.setupView(with: "Nombre(s)", and: user.name)
            return cell
        case 2:
            let cell: ProfileInformationCell = tableView.dequeueCell(at: indexPath)
            cell.setupView(with: "Apellidos", and: user.lastName)
            return cell
        case 3:
            let cell: ProfileInformationCell = tableView.dequeueCell(at: indexPath)
            cell.setupView(with: "Correo", and: user.mail)
            return cell
        case 4:
            let cell: ProfileInformationCell = tableView.dequeueCell(at: indexPath)
            cell.setupView(with: "Telefono", and: user.phone)
            return cell
        case 5:
            let cell: ProfileInformationCell = tableView.dequeueCell(at: indexPath)
            cell.setupView(with: "Genero", and: user.gender.description)
            return cell
        default:
            let cell: ProfileButtonCell = tableView.dequeueCell(at: indexPath)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 150
        case 6:
            return 100
        default:
            return 70
        }
    }
}
