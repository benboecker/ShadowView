//
//  ViewController.swift
//  ShadowView
//
//  Created by Benjamin Böcker on 19.03.16.
//  Copyright © 2016 Ben Böcker. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		

		let baseView = UIView(frame: CGRectMake(200, 200, 100, 100))
		// add the shadow to the base view
		baseView.backgroundColor = UIColor.clearColor()
		baseView.layer.shadowColor = UIColor.blackColor().CGColor
		baseView.layer.shadowOffset = CGSize(width: 3, height: 3)
		baseView.layer.shadowOpacity = 0.7
		baseView.layer.shadowRadius = 4.0
		
		// improve performance
		baseView.layer.shadowPath = UIBezierPath(roundedRect: baseView.bounds, cornerRadius: 10).CGPath
		baseView.layer.shouldRasterize = true
		baseView.layer.rasterizationScale = UIScreen.mainScreen().scale
		
		// add the border to subview
		let borderView = UIView()
		borderView.frame = baseView.bounds
		borderView.layer.cornerRadius = 10
		borderView.layer.borderColor = UIColor.blackColor().CGColor
		borderView.layer.borderWidth = 1.0
		borderView.layer.masksToBounds = true
		baseView.addSubview(borderView)
		
//		// add any other subcontent that you want clipped
//		let otherSubContent = UIImageView()
//		otherSubContent.image = UIImage(named: "lion")
//		otherSubContent.backgroundColor = UIColor.redColor()
//		otherSubContent.frame = borderView.bounds
//		borderView.addSubview(otherSubContent)
		
		self.view.addSubview(baseView)
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

