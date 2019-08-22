//
//  weekDayCellCollectionViewCell.swift
//  Calendar
//
//  Created by Chelsea Lin on 2019/8/22.
//  Copyright © 2019 chelsea lin. All rights reserved.
//

import UIKit

class weekDayCellCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var weekDayLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func updateCell(_ weekDay: WeekDay) {
        weekDayLabel.text = weekDay.week
    }
}
