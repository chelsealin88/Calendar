//
//  CalendarCollectionViewController.swift
//  Calendar
//
//  Created by Chelsea Lin on 2019/8/22.
//  Copyright © 2019 chelsea lin. All rights reserved.
//

import UIKit


class CalendarCollectionViewController: UICollectionViewController {
    
    var weekdays = [WeekDay]()
    
    enum Section: Int {
        case month = 0
        case weekDay
        case day
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        registerNib(nibname: "monthCell")
        registerNib(nibname: "dayCell")
        
        weekdays = WeekDay.getWeek()
        print(weekdays)
    }
    
    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        switch indexPath.section {
        case Section.month.rawValue:
            let monthCell = collectionView.dequeueReusableCell(withReuseIdentifier: "monthCell", for: indexPath) as! monthCellCollectionViewCell
            return monthCell
        case Section.weekDay.rawValue:
            let weekDayCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
            weekDayCell.weekDays = self.weekdays
            return weekDayCell
        default:
            let dayCell = collectionView.dequeueReusableCell(withReuseIdentifier: "dayCell", for: indexPath) as! dayCellCollectionViewCell
            return dayCell
        }
    
    
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        if indexPath.section == 1 {
//            return CGSize(width: collectionView.bounds.width, height: 10.0)
//        }
//
//        return CGSize(width: collectionView.bounds.width, height: 10.0)
//    }
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */
    

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */
    
    func registerNib(nibname: String) {
        let nib = UINib(nibName: nibname, bundle: .main)
        self.collectionView.register(nib, forCellWithReuseIdentifier: nibname)
    }

}

extension UICollectionViewDelegateFlowLayout {
    
    
}


