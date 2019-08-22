//
//  CalendarData.swift
//  Calendar
//
//  Created by Chelsea Lin on 2019/8/22.
//  Copyright © 2019 chelsea lin. All rights reserved.
//

import Foundation


struct WeekDay {

    var week: String?
    
    init(week: String) {
        self.week = week
    }
    
    static func getWeek() ->  [WeekDay] {
        
        var weeks : [WeekDay] = []
        
        for num in 0...6 {
            let week = WeekDay(week: "\(num)")
            weeks.append(week)
        }
        return weeks
    }
}
