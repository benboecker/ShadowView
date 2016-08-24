//
//  ViewController.swift
//  ShadowView
//
//  Created by Benni on 18.08.16.
//  Copyright © 2016 Ben Boecker. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	@IBOutlet weak var shadowView:ShadowView?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
		let w = UISwitch()
		w.frame = CGRectMake(10, 10, 40, 20)
		shadowView?.addSubview(w)
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
		guard let touch = touches.first else {
			return
		}
		UIView.animateWithDuration(0.5) {
			self.shadowView?.center = touch.locationInView(self.view)
		}
	}
}
