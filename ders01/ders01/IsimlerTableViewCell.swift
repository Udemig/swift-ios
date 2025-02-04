//
//  IsimlerTableViewCell.swift
//  ders01
//
//  Created by Mehmet Seyhan on 23.11.2024.
//

import UIKit

class IsimlerTableViewCell: UITableViewCell {
    
    var isimLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .red
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
        
    }
       
    
    func setupUI() {
        contentView.addSubview(isimLabel)
        isimLabel.textColor = .red
        
        
        NSLayoutConstraint.activate([
            isimLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            isimLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            isimLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16),
            isimLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }
    
    func bagla(isim: String) {
        isimLabel.text = isim
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
