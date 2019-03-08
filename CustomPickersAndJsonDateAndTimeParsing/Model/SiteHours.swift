//
//  SiteHours.swift
//  CustomPickersAndJsonDateAndTimeParsing
//
//  Created by Malovic, Milos on 3/6/19.
//  Copyright © 2019 Malovic, Milos. All rights reserved.
//

import Foundation

struct SiteHours: Codable {
   
    private var dayOfWeekInternal: Int
    var dayOfWeek: SitesDayOfWeekKeys {
        return SitesDayOfWeekKeys(rawValue: dayOfWeekInternal) ?? .sunday
    }
    var openingTime: String
    var closingTime: String
    var isClosed: Bool
    
    enum SiteHoursKeys: String, CodingKey {
        case dayOfWeek = "DayOfWeek"
        case openingTime = "OpeningTime"
        case closingTime = "ClosingTime"
        case isClosed = "IsClosed"
    }
    
    enum SitesDayOfWeekKeys: Int {
        case sunday = 0
        case monday
        case tuesday
        case wendsday
        case thursday
        case friday
        case saturday
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: SiteHoursKeys.self)
        dayOfWeekInternal = try values.decode(Int.self, forKey: .dayOfWeek)
        openingTime = try values.decode(String.self, forKey: .openingTime)
        closingTime = try values.decode(String.self, forKey: .closingTime)
        isClosed = try values.decode(Bool.self, forKey: .isClosed)
    }
}
