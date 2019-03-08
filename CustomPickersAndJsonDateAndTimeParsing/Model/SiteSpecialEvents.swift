//
//  SiteSpecialEvents.swift
//  CustomPickersAndJsonDateAndTimeParsing
//
//  Created by Malovic, Milos on 3/6/19.
//  Copyright © 2019 Malovic, Milos. All rights reserved.
//

import Foundation

struct SiteSpecialEvents: Codable {
  
    var specialEventId: Int
    var specialEventStartDate: Date
    var name: String
    var openingTime: Date
    var closingTime: Date
    var isClosed: Bool
    var specialEventEndDate: Date
    var isCompanyWide: Bool
    var specialEventPurpose: String
    
    enum SiteSpecialEventsKeys: String, CodingKey {
        case specialEventId = "SpecialEventId"
        case specialEventStartDate = "SpecialEventStartDate"
        case name = "Name"
        case openingTime = "OpeningTime"
        case closingTime = "ClosingTime"
        case isClosed = "IsClosed"
        case specialEventEndDate = "SpecialEventEndDate"
        case specialEventPurpose = "SpecialEventPurpose"
        case isCompanyWide = "IsCompanyWide"
    }
}
