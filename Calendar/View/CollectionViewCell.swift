//
//  CollectionViewCell.swift
//  Calendar
//
//  Created by Chelsea Lin on 2019/8/22.
//  Copyright © 2019 chelsea lin. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var weekDays = [WeekDay]()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.dataSource = self
        collectionView.delegate = self
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
         return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return weekDays.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "weekdayCell", for: indexPath) as! weekDayCellCollectionViewCell
        let weekDay = weekDays[indexPath.row]
        cell.updateCell(weekDay)
        return cell
    }
    
    
}
