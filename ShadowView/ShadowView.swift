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
	
	// MARK: - Lazy variables
	// ____________________________________________________________________________________________________________________
	
	lazy private var containerView: UIView = {
		let v = UIView()
		v.clipsToBounds = true
		v.frame = self.bounds
		self.addSubview(v)
		self._useSuperAddsubview = false
		return v
	}()
	
	// MARK: - @IBInspectable
	// ____________________________________________________________________________________________________________________
	
	@IBInspectable public var cornerRadius: CGFloat = 10 {
		didSet {
			containerView.layer.cornerRadius = cornerRadius
		}
	}
	
	@IBInspectable public var shadowOffset: CGSize = CGSizeZero {
		didSet {
			self.layer.shadowOffset = shadowOffset
		}
	}
	
	@IBInspectable public var shadowOpacity: CGFloat = 0.5 {
		didSet {
			self.layer.shadowOpacity = Float(shadowOpacity)
		}
	}
	
	@IBInspectable public var shadowRadius: CGFloat = 2.0 {
		didSet {
			self.layer.shadowRadius = shadowRadius
		}
	}
	
	@IBInspectable public var shadowColor: UIColor = UIColor.blackColor() {
		didSet {
			self.layer.shadowColor = shadowColor.CGColor
		}
	}
	
	// MARK: - Public variables
	// ____________________________________________________________________________________________________________________
	
	override public var backgroundColor: UIColor? {
		get {
			return containerView.backgroundColor
		}
		set(newValue) {
			containerView.backgroundColor = newValue
			super.backgroundColor = UIColor.clearColor()
		}
	}
	
	override public var clipsToBounds: Bool {
		get {
			return false
		}
		set {
			super.clipsToBounds = false
		}
	}
	
	// MARK: - Constructor
	// ____________________________________________________________________________________________________________________
	
	convenience init() {
		self.init(frame: CGRectZero)
		setup()
	}
	
	override public init(frame: CGRect) {
		super.init(frame: frame)
		setup()
	}
	
	required public init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		let childViews = self.subviews.filter { $0 != containerView }
		for child in childViews {
			containerView.addSubview(child)
		}
		containerView.backgroundColor = backgroundColor
		super.backgroundColor = UIColor.clearColor()
		setup()
	}
}

typealias ShadowView_Helpers = ShadowView
extension ShadowView_Helpers {
	private func setup() {
		self.clipsToBounds = false
		containerView.layer.cornerRadius = cornerRadius
		self.layer.shadowColor = shadowColor.CGColor
		self.layer.shadowRadius = shadowRadius
		self.layer.shadowOpacity = Float(shadowOpacity)
		self.layer.shadowOffset = shadowOffset
	}
}

typealias ShadowView_Override = ShadowView
extension ShadowView_Override {
	
	override public func addSubview(view: UIView) {
		if (_useSuperAddsubview) {
			super.addSubview(view)
		} else {
			containerView.addSubview(view)
		}
	}
	
	public override func layoutSubviews() {
		super.layoutSubviews()
		containerView.frame = self.bounds
	}
}