//
//  ViewController.swift
//  skritch
//
//  Created by Glenn R. Golden on 6/6/17.
//  Copyright © 2017 Glenn R. Golden. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var sheet: SheetView!
	@IBOutlet weak var clear: UIButton!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	@IBAction func clearSheet(_ sender: UIButton) {
		sheet.clear()
	}
}
