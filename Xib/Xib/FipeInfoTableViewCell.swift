//
//  FipeInfoTableViewCell.swift
//  Xib
//
//  Created by Marcio P Ferreira on 18/11/20.
//

import UIKit

class FipeInfoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var labelInfo: UILabel!
    
    func setup(name: String) {
        labelInfo.text = name
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
