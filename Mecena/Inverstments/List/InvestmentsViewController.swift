//
//  InvestmentsViewController.swift
//  Mecena
//
//  Created by Giovanny Orozco Loaiza on 12/03/20.
//  Copyright © 2020 pjic. All rights reserved.
//

import UIKit

class InvestmentsViewController: UIViewController {

    init() {
        super.init(nibName: String(describing: InvestmentsViewController.self), bundle: nil)
        title = "Inversiones"
        tabBarItem = UITabBarItem(title: "Inversiones", image: #imageLiteral(resourceName: "investments-tab-icon").withRenderingMode(.alwaysOriginal), selectedImage: #imageLiteral(resourceName: "investments-tab-icon-selected").withRenderingMode(.alwaysOriginal))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
