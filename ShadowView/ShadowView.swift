//
//  ShadowView.swift
//  LinksUndRechts
//
//  Created by Benjamin Böcker on 18.03.16.
//  Copyright © 2016 Stünings Medien. All rights reserved.
//

import UIKit

@IBDesignable public class ShadowView: UIView {
	private var _useSuperAddsubview = true
	
	lazy private var containerView: UIView = {
		let v = UIView()
		v.clipsToBounds = true
		v.frame = self.bounds
		self.addSubview(v)
		self._useSuperAddsubview = false
		return v
	}()
	
	

	@IBInspectable public var cornerRadius: CGFloat = 10 {
		didSet {
			self.configureShadowView()
		}
	}
	@IBInspectable public var shadowOffset: CGSize = CGSize(width: 0.0, height: 1.0) {
		didSet {
			self.configureShadowView()
		}
	}
	@IBInspectable public var shadowRadius: CGFloat = 1.0 {
		didSet {
			self.configureShadowView()
		}
	}
	@IBInspectable public var shadowColor: UIColor = UIColor.blackColor() {
		didSet {
			self.configureShadowView()
		}
	}
	
	override public init(frame: CGRect) {
		super.init(frame: frame)
	}
	
	required public init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		let childViews = self.subviews.filter { $0 != containerView }
		for child in childViews {
			containerView.addSubview(child)
		}
		containerView.backgroundColor = backgroundColor
		super.backgroundColor = UIColor.clearColor()
	}
	
	override public var backgroundColor: UIColor? {
		get {
			return containerView.backgroundColor
		}
		set(newValue) {
			containerView.backgroundColor = newValue
			super.backgroundColor = UIColor.clearColor()
		}
	}
	
	private func configureShadowView() {
		self.clipsToBounds = false
		containerView.layer.cornerRadius = cornerRadius
		
		self.layer.shadowColor = shadowColor.CGColor
		self.layer.shadowOffset = self.shadowOffset
		self.layer.shadowOpacity = 0.5
		self.layer.shadowRadius = self.shadowRadius
	}

	override public func addSubview(view: UIView) {
		if (!_useSuperAddsubview) {
			containerView.addSubview(view)
		} else {
			super.addSubview(view)
		}
	}
	
	public override func layoutSubviews() {
		super.layoutSubviews()
		containerView.frame = self.bounds
	}
}