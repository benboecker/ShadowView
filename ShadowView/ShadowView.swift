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
	private var shadowView: UIView?
	
	@IBInspectable var cornerRadius: CGFloat = 10 {
		didSet {
			self.layer.cornerRadius = cornerRadius
			self.layer.masksToBounds = cornerRadius > 0
			if let shadowView = self.shadowView {
				shadowView.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.cornerRadius).CGPath
			}
		}
	}
	
	override func drawRect(rect: CGRect) {
		super.drawRect(rect)
		
		guard let _ = self.shadowView else {
			self.createShadowView()
			return
		}
	}
	
	private func createShadowView() {
		self.shadowView = UIView(frame: self.frame)
		
		guard let shadowView = self.shadowView else {
			return
		}
		guard let superview = self.superview else {
			return
		}
		
		shadowView.backgroundColor = UIColor.clearColor()
		shadowView.layer.shadowColor = UIColor.darkGrayColor().CGColor
		shadowView.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.cornerRadius).CGPath
		shadowView.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
		shadowView.layer.shadowOpacity = 0.5
		shadowView.layer.shadowRadius = 1
		shadowView.layer.masksToBounds = true
		shadowView.clipsToBounds = false
		
		superview.insertSubview(shadowView, belowSubview: self)
	}
}