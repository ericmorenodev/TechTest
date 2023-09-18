//
//  HomeCustomCellView.swift
//  TechTest
//
//  Created by Eric Moreno on 15/9/23.
//

import Foundation
import UIKit
class HomeCustomCellView: UITableViewCell {
    @IBOutlet var peopleImage: UIImageView!
    @IBOutlet var lblName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            contentView.backgroundColor = UIColor.systemBlue // Change the background color
        } else {
            contentView.backgroundColor = UIColor.clear // Restore the background collor
        }
    }

    func setupUI() {
        // Cell style
        contentView.layer.cornerRadius = 10
        contentView.layer.borderWidth = 0.8
        contentView.layer.borderColor = UIColor.lightGray.cgColor
        contentView.layer.shadowOffset = CGSize(width: 0, height: 2)
        contentView.layer.shadowOpacity = 0.2
        contentView.layer.shadowRadius = 4.0
        contentView.clipsToBounds = true

        // Photo style
        peopleImage.layer.cornerRadius = peopleImage.frame.size.width / 2.8
        peopleImage.contentMode = .scaleAspectFill

        // Name style
        lblName.font = UIFont.boldSystemFont(ofSize: 16)
        lblName.textColor = .black
    }
}
