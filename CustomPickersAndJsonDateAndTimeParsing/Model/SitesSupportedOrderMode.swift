//
//  SitesSupportedOrderMode.swift
//  CustomPickersAndJsonDateAndTimeParsing
//
//  Created by Malovic, Milos on 3/6/19.
//  Copyright © 2019 Malovic, Milos. All rights reserved.
//

import Foundation

struct SitesSupportedOrderMode: Codable {
    
    var pickup : Int
    var delivery : Int
    var curbside : Int
    var svcDeposit: Int
    var dineIn: Int
    var unknown: Int
    var undefined: Int
    var driveThrough: Int
    
    enum SitesSupportedOrderModeKeys: String, CodingKey {
        case pickup = "Pickup"
        case delivery = "Delivery"
        case curbside = "Curbside"
        case svcDeposit = "SVCDeposit"
        case dineIn = "DineIn"
        case unknown = "Unknown"
        case undefined = "Undefined"
        case driveThrough = "DriveThrough"
    }
}
