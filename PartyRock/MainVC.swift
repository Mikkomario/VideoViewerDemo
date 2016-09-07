//
//  ViewController.swift
//  PartyRock
//
//  Created by Mikko Hilpinen on 5.9.2016.
//  Copyright © 2016 Mikko Hilpinen. All rights reserved.
//

import UIKit

// You need these two protocols when working with table view
class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource
{
	@IBOutlet weak var videoTableView: UITableView!
	
	var videos = [VideoInfo]()
	
	override func viewDidLoad()
	{
		super.viewDidLoad()
		
		// Some hard coded data for now
		let video1 = VideoInfo(imageURL: "https://i.ytimg.com/vi/QgrjTWKxEjg/hqdefault.jpg?custom=true&w=196&h=110&stc=true&jpg444=true&jpgq=90&sp=68&sigh=UENop9KQcUQNd_7hYlVbFfCHwmo", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/QgrjTWKxEjg?list=UU8Wh7qpPGJm3K1eZ6DHjpKA\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "FFIV: Evisceration")
		let video2 = VideoInfo(imageURL: "https://i.ytimg.com/vi/EDwbCUFJR4U/hqdefault.jpg?custom=true&w=196&h=110&stc=true&jpg444=true&jpgq=90&sp=68&sigh=dWXl89V97nfOwisDd2eZ8oNrFcA", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/EDwbCUFJR4U?list=UU8Wh7qpPGJm3K1eZ6DHjpKA\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "ALttP: Come to the Dark Side, It's a Funky Place")
		
		videos.append(video1)
		videos.append(video2)
		
		// Remember to set listeners to the table view
		videoTableView.delegate = self
		videoTableView.dataSource = self
	}
	
	public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
	{
		return videos.count
	}
	
	public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
	{
		if let cell = tableView.dequeueReusableCell(withIdentifier: "VideoCell", for: indexPath) as? VideoCell
		{
			let videoInfo = videos[indexPath.row]
			cell.updateUI(videoInfo: videoInfo)
			return cell
		}
		else
		{
			return UITableViewCell()
		}
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
	{
		let video = videos[indexPath.row]
		performSegue(withIdentifier: "VideoVC", sender: video) // Video as sender
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?)
	{
		if let destination = segue.destination as? VideoVC
		{
			if let video = sender as? VideoInfo // reads video from sender
			{
				destination.displayedVideoInfo = video
			}
		}
	}
}

