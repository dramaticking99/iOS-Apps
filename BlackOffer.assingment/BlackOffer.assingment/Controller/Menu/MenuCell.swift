//
//  MenuCell.swift
//  BlackOffer.assingment
//
//  Created by Chetan Sanwariya on 08/04/24.
//

import UIKit

class MenuCell: UICollectionViewCell {

    @IBOutlet weak var menuItemLable: UILabel!
    
    override var isSelected: Bool {
        didSet {
            menuItemLable.textColor = isSelected ? .white : .gray
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
