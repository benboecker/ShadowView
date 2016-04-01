//
//  ShadowView.swift
//  LinksUndRechts
//
//  Created by Benjamin Böcker on 18.03.16.
//  Copyright © 2016 Stünings Medien. All rights reserved.
//

import UIKit

@IBDesignable class ShadowView: UIView {
	private var shadowView: UIView?
	
	@IBInspectable var cornerRadius: CGFloat = 10 {
		didSet {
			self.configureShadowView()
		}
	}
	@IBInspectable var shadowOffset: CGSize = CGSize(width: 0.0, height: 1.0) {
		didSet {
			self.configureShadowView()
		}
	}
	@IBInspectable var shadowRadius: CGFloat = 1.0 {
		didSet {
			self.configureShadowView()
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
		
		self.configureShadowView()
		
		superview.insertSubview(shadowView, belowSubview: self)
	}
	
	private func configureShadowView() {
		guard let shadowView = self.shadowView else {
			return
		}
		
		self.layer.cornerRadius = self.cornerRadius
		self.layer.masksToBounds = self.cornerRadius > 0
		
		shadowView.backgroundColor = UIColor.clearColor()
		shadowView.layer.shadowColor = UIColor.darkGrayColor().CGColor
		shadowView.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.cornerRadius).CGPath
		shadowView.layer.shadowOffset = self.shadowOffset
		shadowView.layer.shadowOpacity = 0.5
		shadowView.layer.shadowRadius = self.shadowRadius
		
		shadowView.clipsToBounds = false
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		
		guard let shadowView = self.shadowView else {
			return
		}
		
		shadowView.frame = self.frame
		shadowView.layer.shadowPath = UIBezierPath(roundedRect: shadowView.bounds, cornerRadius: self.cornerRadius).CGPath
	}
}


