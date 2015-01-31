//
//  ViewController.swift
//  Nov25
//
//  Created by edwin vazquez on 1/31/15.
//  Copyright (c) 2015 A Perfect Empire. All rights reserved.
//

import UIKit;
import AudioToolbox;	//needed for SystemSoundID

class ViewController: UIViewController {
	var sid: SystemSoundID = 0;

	required init(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder);
		
		//Find the full pathname of the sound file chinese.wav.
		let bundle: NSBundle = NSBundle.mainBundle();
		let path: String? = bundle.pathForResource("godzilla", ofType: "wav");
		if path == nil {
			println("could not find file godzilla.wav");
			return;
		}
		println("path = \(path!)\n");
		
		//Create a URL that refers to the sound file.
		let url: NSURL? = NSURL(fileURLWithPath: path!, isDirectory: false);
		if url == nil {
			println("could not create url");
			return;
		}
		println("url = \(url!)\n");
		
		//Open the sound file.
		let status: OSStatus = AudioServicesCreateSystemSoundID(url!, &sid);
		if status != OSStatus(kAudioServicesNoError) {
			println("could not create system sound ID, status = \(status)");
			return;
		}
		println("sid = \(sid)\n");
	}

	//Implant a reference to my own self (i.e., the ViewController)
	//into the newborn View.

	override func loadView() {
		view = View(viewController: self);
	}

	override func viewDidLoad() {
		super.viewDidLoad();
		// Do any additional setup after loading the view, typically from a nib.
	}

	func touchUpInside(button: UIButton!) {
		var title: String? = button.titleForState(UIControlState.Normal);
		if title == nil {
			title = "untitled";
		}
		println("touchUpInside title = \(title!)");
		//AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate));
		AudioServicesPlaySystemSound(sid);
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

