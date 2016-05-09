//
//  GameVC.swift
//  BrainTeaser
//
//  Created by Alex Nguyen on 2016-05-08.
//  Copyright © 2016 Alex Nguyen. All rights reserved.
//

import UIKit
import pop

class GameVC: UIViewController {

    @IBOutlet weak var yesBtn: CustomButton!
    @IBOutlet weak var noBtn: CustomButton!
    @IBOutlet weak var titleLbl: UILabel!
    
    var currentCard: Card!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentCard = createCardFromNib()
        currentCard.center = AnimationEngine.offScreenRightPosition
        self.view.addSubview(currentCard)
        
    }
    override func viewDidAppear(animated: Bool) {
        AnimationEngine.animateToPosition(currentCard, position: CGPointMake(CGRectGetMidX(UIScreen.mainScreen().bounds), CGRectGetMidY(UIScreen.mainScreen().bounds)), completion: {_,_ in } )
    }
    @IBAction func yesBtnPressed(sender: UIButton) {
        if sender.titleLabel?.text == "YES" {
            checkAnswer()
        } else {
            titleLbl.text = "Does this card match the previous?"
        }
        showNextCard()
    }
    @IBAction func noBtnPressed(sender: UIButton) {
        checkAnswer()
        showNextCard()
    }
    func showNextCard() {
        if let current = currentCard {
            let cardToRemove = current
            currentCard = nil
            AnimationEngine.animateToPosition(cardToRemove, position: AnimationEngine.offScreenLeftPosition, completion: { (anim: POPAnimation!, finished: Bool) in
                cardToRemove.removeFromSuperview()
            })
        }
        if let next = createCardFromNib() {
            next.center = AnimationEngine.offScreenRightPosition
            self.view.addSubview(next)
            currentCard = next
            if noBtn.hidden {
                noBtn.hidden = false
                yesBtn.setTitle("YES", forState: .Normal)
            }
            AnimationEngine.animateToPosition(next, position: AnimationEngine.screenCenterPosition, completion: { (anim: POPAnimation!, finished: Bool) in
                
                
            })
        }
    }
    func createCardFromNib() -> Card? {
        return NSBundle.mainBundle().loadNibNamed("Card", owner: self, options: nil)[0] as? Card
    }
    func checkAnswer() {
    
    }
}
