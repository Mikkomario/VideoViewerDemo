//
//  VideoVC.swift
//  PartyRock
//
//  Created by Mikko Hilpinen on 5.9.2016.
//  Copyright © 2016 Mikko Hilpinen. All rights reserved.
//

import UIKit

class VideoVC: UIViewController
{
	// wkWebView is the new hot webView (need to import)
	@IBOutlet weak var webView: UIWebView!
	@IBOutlet weak var titleLabel: UILabel!
	
	private var _displayedVideoInfo: VideoInfo!
	
	var displayedVideoInfo: VideoInfo
	{
		get {return _displayedVideoInfo}
		set {_displayedVideoInfo = newValue}
	}

    override func viewDidLoad()
	{
        super.viewDidLoad()
		titleLabel.text = displayedVideoInfo.videoTitle
		webView.loadHTMLString(displayedVideoInfo.videoURL, baseURL: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
