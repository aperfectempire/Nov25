//
//  View.swift
//  Nov25
//
//  Created by edwin vazquez on 1/31/15.
//  Copyright (c) 2015 A Perfect Empire. All rights reserved.
//


import UIKit;

class View: UIView {

	//Called from the loadView method of the ViewController.

	init(viewController: ViewController) {
		// Initialization code
		super.init(frame: CGRectZero);
		backgroundColor = UIColor.whiteColor();

		let button: UIButton = UIButton.buttonWithType(UIButtonType.System) as UIButton;
		button.bounds.size = CGSizeMake(200, 40);
		
		let fontSize: CGFloat = UIFont.buttonFontSize();
		button.titleLabel!.font = UIFont.systemFontOfSize(fontSize);

		//Put the button at the center of this View.
		button.center = center;

		//Keep the button at the center of this View,
		//even if the size of this View changes.

		button.autoresizingMask =
			  UIViewAutoresizing.FlexibleLeftMargin
			| UIViewAutoresizing.FlexibleRightMargin
			| UIViewAutoresizing.FlexibleTopMargin
			| UIViewAutoresizing.FlexibleBottomMargin;

		button.backgroundColor = UIColor.whiteColor();
		button.layer.borderWidth = 0.5;	//0.5 pairs of pixels = 1 pixel
		button.layer.borderColor = UIColor.redColor().CGColor;
		button.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal);
		button.setTitle("Godzilla!", forState: UIControlState.Normal);

		button.addTarget(viewController,
			action: "touchUpInside:",
			forControlEvents: UIControlEvents.TouchUpInside);

		addSubview(button);
	}

	//Never called.
	required init(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder);
	}

	/*
	// Only override drawRect: if you perform custom drawing.
	// An empty implementation adversely affects performance during animation.
	override func drawRect(rect: CGRect)
	{
		// Drawing code
	}
	*/

}

