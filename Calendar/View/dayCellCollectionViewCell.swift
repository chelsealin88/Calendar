//
//  dayCellCollectionViewCell.swift
//  Calendar
//
//  Created by Chelsea Lin on 2019/8/22.
//  Copyright © 2019 chelsea lin. All rights reserved.
//

import UIKit

class dayCellCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var dayLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
    }
    
    func updateCell() {
        
//        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.lightGray.cgColor
    }
    
   

}
