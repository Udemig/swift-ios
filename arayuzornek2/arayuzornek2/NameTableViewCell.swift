//
//  NameTableViewCell.swift
//  arayuzornek2
//
//  Created by Mehmet Seyhan on 16.11.2024.
//

import UIKit

class NameTableViewCell: UITableViewCell {

    @IBOutlet weak var isimLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
