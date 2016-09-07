//
//  VideoCell.swift
//  PartyRock
//
//  Created by Mikko Hilpinen on 5.9.2016.
//  Copyright © 2016 Mikko Hilpinen. All rights reserved.
//

import UIKit

class VideoCell: UITableViewCell
{
	@IBOutlet weak var videoPreviewImage: UIImageView!
	@IBOutlet weak var videoTitleLabel: UILabel!
	
    override func awakeFromNib()
	{
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool)
	{
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

	func updateUI(videoInfo: VideoInfo)
	{
		videoTitleLabel.text = videoInfo.videoTitle
		
		// Sets image from URL
		let url = URL(string: videoInfo.imageURL)!
		print("Starting image load")
		DispatchQueue.global().async // Loads the image on a background thread
		{
			do
			{
				let data = try Data(contentsOf: url)
				DispatchQueue.global().sync // Applies the changes in the UI thread
				{
					print("Updating video image")
					self.videoPreviewImage.image = UIImage(data: data)
				}
			}
			catch
			{
				// TODO: Handle the error
				print("Error while loading image")
			}
		}
	}
}
