//
//  CalendarViewController.swift
//  Calendar
//
//  Created by Chelsea Lin on 2019/8/22.
//  Copyright © 2019 chelsea lin. All rights reserved.
//

import UIKit

class CalendarViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var monthLabel: UILabel!
    
    
    var currentYear = Calendar.current.component(.year, from: Date())
    var currentMonth = Calendar.current.component(.month, from: Date())

    var numberOfDaysInThisMonth : Int {
        let dateComponents = DateComponents(year: currentYear, month: currentMonth)
        let date = Calendar.current.date(from: dateComponents)!
        let range = Calendar.current.range(of: .day, in: .month, for: date)
        return range?.count ?? 0
    }
    
    var today : Int {
        let dateComponents = DateComponents(year: currentYear, month: currentMonth)
        let date = Calendar.current.date(from: dateComponents)!
        return Calendar.current.component(.weekday, from: date)
    }
    
    var emptyDay : Int {
        return today - 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        settingUI()
        print(currentYear)
        print(currentMonth)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        collectionView.collectionViewLayout.invalidateLayout()
        collectionView.reloadData()
    }
    
    @IBAction func previousBtn(_ sender: Any) {
        currentMonth -= 1
        if currentMonth == 0 {
            currentMonth = 12
            currentYear -= 1
        }
        settingUI()
    }
    
    @IBAction func nextBtn(_ sender: Any) {
       currentMonth += 1
        if currentMonth == 13 {
            currentMonth = 1
            currentYear += 1
        }
        settingUI()
    }
    
    func settingUI() {
        monthLabel.text = "\(currentMonth)月\(currentYear)"
        collectionView.reloadData()
        print(today)
    }


}

extension CalendarViewController : UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfDaysInThisMonth + emptyDay
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "dayCell", for: indexPath) as! dayCellCollectionViewCell
        if indexPath.row < emptyDay {
            cell.dayLabel.text = ""
        } else {
            cell.dayLabel.text = "\(indexPath.row + 1 - emptyDay)"
        }
        return cell
    }
    
    
    
}
