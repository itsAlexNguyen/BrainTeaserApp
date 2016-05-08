//
//  CustomButton.swift
//  BrainTeaser
//
//  Created by Alex Nguyen on 2016-05-08.
//  Copyright © 2016 Alex Nguyen. All rights reserved.
//

import UIKit
@IBDesignable
class CustomButton: UIButton {
    @IBInspectable var cornerRadius: CGFloat = 3.0 {
        didSet {
            setupView()
        }
    }
    @IBInspectable var fontColor: UIColor = UIColor.whiteColor() {
        didSet {
            self.tintColor = fontColor
        }
    }
    override func awakeFromNib() {
        setupView()
    }
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupView()
    }
    func setupView() {
        self.layer.cornerRadius = cornerRadius
    }
}
