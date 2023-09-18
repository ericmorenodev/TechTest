//
//  HomeCustomCellView.swift
//  TechTest
//
//  Created by Eric Moreno on 15/9/23.
//

import Foundation
import UIKit
class HomeCustomCellView: UITableViewCell {
    @IBOutlet var lblName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
