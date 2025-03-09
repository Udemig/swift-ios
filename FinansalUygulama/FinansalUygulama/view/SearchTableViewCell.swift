//
//  SearchTableViewCell.swift
//  FinansalUygulama
//
//  Created by Mehmet Seyhan on 9.03.2025.
//

import UIKit

class SearchTableViewCell: UITableViewCell {
    
    @IBOutlet weak var assetSymbolLabel: UILabel!
    
    @IBOutlet weak var assetTypeLabel: UILabel!
    
    @IBOutlet weak var assetNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with searchResult: SearchResult) {
        assetNameLabel.text = searchResult.name
        assetSymbolLabel.text = searchResult.symbol
        assetTypeLabel.text = searchResult.type
            .appending(" ")
            .appending(searchResult.currency)
    }

}
