//
//  ShadowView.swift
//  LinksUndRechts
//
//  Created by Benjamin Böcker on 18.03.16.
//  Copyright © 2016 Stünings Medien. All rights reserved.
//

import UIKit

@IBDesignable class ShadowView: UIView {
	var shadowAdded: Bool = false
	
	@IBInspectable var cornerRadius: CGFloat = 10 {
		didSet {
			self.layer.cornerRadius = cornerRadius
			self.layer.masksToBounds = cornerRadius > 0
		}
	}
	
	override func drawRect(rect: CGRect) {
		super.drawRect(rect)
		
		if self.shadowAdded {
			return
		}
		
		self.shadowAdded = true
		
		let shadowView = UIView(frame: self.frame)
		shadowView.backgroundColor = UIColor.clearColor()
		shadowView.layer.shadowColor = UIColor.darkGrayColor().CGColor
		shadowView.layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: self.cornerRadius).CGPath
		shadowView.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
		shadowView.layer.shadowOpacity = 0.5
		shadowView.layer.shadowRadius = 1
		shadowView.layer.masksToBounds = true
		shadowView.clipsToBounds = false
		
		self.superview?.insertSubview(shadowView, belowSubview: self)
//		self.superview?.addSubview(shadowView)
//		self.superview?.bringSubviewToFront(self)
	}
}