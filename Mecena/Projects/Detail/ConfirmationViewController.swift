//
//  ConfirmationViewController.swift
//  Mecena
//
//  Created by Giovanny Orozco Loaiza on 31/03/20.
//  Copyright © 2020 pjic. All rights reserved.
//

import UIKit
protocol ConfirmationViewControllerDelegate: class {
        
    func dismissViewController(_ viewController: ConfirmationViewController)
}

class ConfirmationViewController: UIViewController {

    @IBOutlet private weak var backgroundView: UIView!
    @IBOutlet private weak var messageLabel: UILabel!
    
    weak var delegate: ConfirmationViewControllerDelegate?
    private let message: String
    
    init(message: String) {
        self.message = message
        super.init(nibName: String(describing: ConfirmationViewController.self), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageLabel.text = message
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.3) {
            self.backgroundView.alpha = 1
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        UIView.animate(withDuration: 0.3,
                       animations: {
                        self.backgroundView.alpha = 0
        },
                       completion: { _ in
                        self.delegate?.dismissViewController(self)
        })
    }
    
    @IBAction func closeButtonPressed() {
        UIView.animate(withDuration: 0.3,
                       animations: {
                        self.backgroundView.alpha = 0
        },
                       completion: { _ in
                        self.delegate?.dismissViewController(self)
        })
    }
}
