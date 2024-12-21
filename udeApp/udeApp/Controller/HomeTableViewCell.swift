//
//  HomeTableViewCell.swift
//  udeApp
//
//  Created by Mehmet Seyhan on 30.11.2024.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(userItem: UserListItem){
        Helper.imageLoad(imageView: userImage, url: userItem.photoUrl!)
        userNameLabel.text = userItem.name
        
       
    }

}
