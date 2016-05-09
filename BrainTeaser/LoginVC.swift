//
//  ViewController.swift
//  BrainTeaser
//
//  Created by Alex Nguyen on 2016-05-08.
//  Copyright © 2016 Alex Nguyen. All rights reserved.
//

import UIKit
import pop

class LoginVC: UIViewController {
    @IBOutlet weak var emailConstraint: NSLayoutConstraint!
    @IBOutlet weak var passwordConstraint: NSLayoutConstraint!
    @IBOutlet weak var loginConstraint: NSLayoutConstraint!
    @IBOutlet weak var passwordLeadingEdge: NSLayoutConstraint!
    @IBOutlet weak var loginLeadingEdge: NSLayoutConstraint!
    @IBOutlet weak var emailLeadingEdge: NSLayoutConstraint!
    var animationEngine: AnimationEngine!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.animationEngine = AnimationEngine(constraints: [emailConstraint, emailLeadingEdge, passwordConstraint, passwordLeadingEdge, loginConstraint, loginLeadingEdge])
    }
    override func viewDidAppear(animated: Bool) {
        self.animationEngine.animateOnScreen(1)
    }
}

