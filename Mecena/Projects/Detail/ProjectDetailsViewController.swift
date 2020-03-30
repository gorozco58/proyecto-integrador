//
//  ProjectDetailsViewController.swift
//  Mecena
//
//  Created by Giovanny Orozco Loaiza on 30/03/20.
//  Copyright © 2020 pjic. All rights reserved.
//

import UIKit

class ProjectDetailsViewController: UIViewController {

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
    }

}
