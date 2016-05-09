//
//  Card.swift
//  BrainTeaser
//
//  Created by Alex Nguyen on 2016-05-08.
//  Copyright © 2016 Alex Nguyen. All rights reserved.
//

import UIKit

class Card: UIView {
    let shapes = ["shape1", "shape2", "shape3"]
    var currentShape: String!
    
    @IBOutlet weak var shapeImage: UIImageView!
    
    @IBInspectable var cornerRadius: CGFloat = 3.0 {
        didSet {
            setupView()
        }
    }
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupView()
        selectShape()
    }
    override func awakeFromNib() {
        setupView()
    }
    func setupView() {
        self.layer.shadowOpacity = 0.8
        self.layer.shadowRadius = 5.0
        self.layer.shadowOffset = CGSizeMake(0.0, 2.0)
        self.layer.shadowColor = UIColor(red: 157.0/255.0, green: 157.0/255.0, blue: 157.0/255.0, alpha: 1.0).CGColor
        self.setNeedsLayout()
    }
    func selectShape() {
        currentShape = shapes[Int(arc4random_uniform(3))]
        shapeImage.image = UIImage(named: currentShape)
    }
}
