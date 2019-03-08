//
//  Sites.swift
//  CustomPickersAndJsonDateAndTimeParsing
//
//  Created by Malovic, Milos on 3/6/19.
//  Copyright © 2019 Malovic, Milos. All rights reserved.
//

import Foundation

struct Sites: Codable {
    var siteId: Int
    var externalId: String
    var siteName: String
    var adressLine1: String
    var city: String
    var state: String
    var postal: String
    var voicePhone: String
    var isEnabled: Bool
    var isLoyaltyEnabled: Bool
    var latitude: Double
    var longitude: Double
    var userDistance: Double
    var orderTypesSupported: [String]
    var isWorking: Bool
    var openAt: String?
    var deliveryRange: Double
    
    private var siteStatusInternal: Int
    var siteStatus: SiteStatusKeys {
        return SiteStatusKeys(rawValue: siteStatusInternal) ?? .siteIsUp
    }
    
    var hour: [SiteHours]
    var specialEvents: [SiteSpecialEvents]
    var supportedOrderModes: Int
    
    enum SitesKeys: String, CodingKey {
        case siteId = "SiteId"
        case externalId = "ExternalId"
        case siteName = "SiteName"
        case adressLine1 = "AddressLine1"
        case city = "City"
        case state = "State"
        case postal = "Postal"
        case voicePhone = "VoicePhone"
        case isEnabled = "IsEnabled"
        case isLoyaltyEnabled = "IsLoyaltyEnabled"
        case latitude = "Latitude"
        case longitude = "Longitude"
        case userDistance = "UserDistance"
        case siteStatus = "SiteStatus"
        case hour = "Hours"
        case specialEvents = "SpecialEvents"
        case supportedOrderModes = "SupportedOrderModes"
        case orderTypesSupported = "OrderTypesSupported"
        case isWorking = "IsWorking"
        case openAt = "OpenAt"
        case deliveryRange = "DeliveryRange"
    }
    
    enum SiteStatusKeys: Int {
        case siteIsUp = 0
        case atoFailed
        case emergencyClosed
    }
    
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: SitesKeys.self)
        latitude = try values.decode(Double.self, forKey: .latitude)
        longitude = try values.decode(Double.self, forKey: .longitude)
        siteId = try values.decode(Int.self, forKey: .siteId)
        siteName = try values.decode(String.self, forKey: .siteName)
        deliveryRange = try values.decode(Double.self, forKey: .deliveryRange)
        openAt? = try values.decodeIfPresent(String.self, forKey: .openAt) ?? "Open now"
        isEnabled = try values.decode(Bool.self, forKey: .isEnabled)
        isWorking = try values.decode(Bool.self, forKey: .isWorking)
        isLoyaltyEnabled = try values.decode(Bool.self, forKey: .isLoyaltyEnabled)
        orderTypesSupported = try values.decode([String].self, forKey: .orderTypesSupported)
        supportedOrderModes = try values.decode(Int.self, forKey: .supportedOrderModes)
        specialEvents = try values.decode([SiteSpecialEvents].self, forKey: .specialEvents)
        userDistance = try values.decode(Double.self, forKey: .userDistance)
        adressLine1 = try values.decode(String.self, forKey: .adressLine1)
        siteStatusInternal = try values.decode(Int.self, forKey: .siteStatus)
        hour = try values.decode([SiteHours].self, forKey: .hour)
        voicePhone = try values.decode(String.self, forKey: .voicePhone)
        externalId = try values.decode(String.self, forKey: .externalId)
        postal = try values.decode(String.self, forKey: .postal)
        city = try values.decode(String.self, forKey: .city)
        state = try values.decode(String.self, forKey: .state)
    }
}
