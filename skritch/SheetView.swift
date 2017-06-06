//
//  SheetView.swift
//  skritch
//
//  Created by Glenn R. Golden on 6/6/17.
//  Copyright © 2017 Glenn R. Golden. All rights reserved.
//

import Foundation

import UIKit

class SheetView : UIView
{
	var points: [CGPoint] = []
	
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
	{
		guard
			let touch = touches.first
			else
		{
			return;
		}
		
		let touchLocationInView = touch.location(in: self)
		
		addPoint(touchLocationInView)
		setNeedsDisplay()
	}
	
	override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?)
	{
		guard
			let touch = touches.first
			else
		{
			return;
		}
		
		let touchLocationInView = touch.location(in: self)
		
		addPoint(touchLocationInView)
		setNeedsDisplay()
	}
	
	override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?)
	{
		guard
			let touch = touches.first
			else
		{
			return;
		}
		
		let touchLocationInView = touch.location(in: self)
		
		addPoint(touchLocationInView)
		setNeedsDisplay()
	}
	
	override func draw(_ rect: CGRect)
	{
		guard
			let context = UIGraphicsGetCurrentContext(),
			let first = points.first
			else
		{
			return
		}
		
		context.move(to: first)
		for point in points
		{
			context.addLine(to: point)
		}
		
		context.setLineCap(.round)
		context.setLineWidth(1.0)
		context.setStrokeColor(red: 1, green: 1, blue: 1, alpha: 1)
		context.setBlendMode(.normal)
		
		context.strokePath()
	}
	
	func addPoint(_ point: CGPoint)
	{
		points.append(point)
	}
}
