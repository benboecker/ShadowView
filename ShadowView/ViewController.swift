//
//  ViewController.swift
//  ShadowView
//
//  Created by Ben Boecker on 18.08.16.
//  Copyright © 2016 Ben Boecker. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	var shadowView: ShadowView = ShadowView(frame: CGRect(x: 50, y: 70, width: 250, height: 350))

	override func viewDidLoad() {
		super.viewDidLoad()

		self.shadowView.backgroundColor = UIColor.white
		self.shadowView.shadowRadius = 10.0

		self.view.addSubview(self.shadowView)
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

