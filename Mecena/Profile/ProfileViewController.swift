//
//  ProfileViewController.swift
//  Mecena
//
//  Created by Giovanny Orozco Loaiza on 12/03/20.
//  Copyright © 2020 pjic. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    init() {
        super.init(nibName: String(describing: ProfileViewController.self), bundle: nil)
        title = "Perfil"
        tabBarItem = UITabBarItem(title: "Perfil", image: #imageLiteral(resourceName: "profile-tab-icon").withRenderingMode(.alwaysOriginal), selectedImage: #imageLiteral(resourceName: "profile-tab-icon-selected").withRenderingMode(.alwaysOriginal))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
