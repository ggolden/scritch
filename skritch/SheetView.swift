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
	var segments: [Segment] = []

	var width: Float = 0
	let colors = [UIColor.white, UIColor.blue, UIColor.cyan, UIColor.red, UIColor.green, UIColor.lightGray, UIColor.magenta, UIColor.orange, UIColor.purple, UIColor.yellow]
	var colorsIndex = 0
	
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
	{
		guard
			let touch = touches.first
		else
		{
			return;
		}
		
		// start a new segment
		segments.append(Segment())
		
		// temp
		width += 0.25
		segments.last?.width = width
		segments.last?.color = colors[colorsIndex]
		colorsIndex = (colorsIndex+1) % colors.count
		print("\(segments.last!.color) \(segments.last!.width)")
		
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
			let context = UIGraphicsGetCurrentContext()
		else
		{
			return
		}
		
		for segment in segments
		{
			if let first = segment.points.first
			{
				context.move(to: first)
				for point in segment.points
				{
					context.addLine(to: point)
				}
				
				context.setLineCap(.round)
				context.setLineWidth(CGFloat(segment.width))
				
				context.setStrokeColor(segment.color.cgColor)
				context.setBlendMode(.normal)
				
				context.strokePath()
			}
		}
	}
	
	// add a point to the last segment
	func addPoint(_ point: CGPoint)
	{
		guard
			let seg = segments.last
		else {
			return
		}
		
		seg.points.append(point)
	}
	
	func clear()
	{
		segments = []
		width = 0;
		colorsIndex = 0;
		
		setNeedsDisplay()
	}
}
