//
//  JSONFile.swift
//  CustomPickersAndJsonDateAndTimeParsing
//
//  Created by Malovic, Milos on 3/6/19.
//  Copyright © 2019 Malovic, Milos. All rights reserved.
//

import Foundation

var jsonData = """

[
{
"SiteId": 6,
"ExternalId": "00006",
"SiteName": "Coffee Test #6",
"AddressLine1": "595-599 S Hill St",
"City": "Los Angeles",
"State": "CA",
"Postal": "90014",
"VoicePhone": "111-111-1111",
"IsEnabled": true,
"IsLoyaltyEnabled": true,
"Latitude": 34.0474288,
"Longitude": -118.2530461,
"UserDistance": 0,
"SiteStatus": 0,
"Hours": [
{
"DayOfWeek": 0,
"OpeningTime": "12:00 AM",
"ClosingTime": "11:00 PM",
"IsClosed": false
},
{
"DayOfWeek": 1,
"OpeningTime": "12:00 AM",
"ClosingTime": "11:00 PM",
"IsClosed": false
},
{
"DayOfWeek": 2,
"OpeningTime": "12:00 AM",
"ClosingTime": "11:00 PM",
"IsClosed": false
},
{
"DayOfWeek": 3,
"OpeningTime": "12:00 AM",
"ClosingTime": "11:00 PM",
"IsClosed": false
},
{
"DayOfWeek": 4,
"OpeningTime": "12:00 AM",
"ClosingTime": "11:00 PM",
"IsClosed": false
},
{
"DayOfWeek": 5,
"OpeningTime": "12:00 AM",
"ClosingTime": "11:00 PM",
"IsClosed": false
},
{
"DayOfWeek": 6,
"OpeningTime": "12:00 AM",
"ClosingTime": "11:00 PM",
"IsClosed": false
}
],
"SpecialEvents": [],
"SupportedOrderModes": 19,
"OrderTypesSupported": [
"Pickup",
"Delivery",
"DineIn"
],
"IsWorking": true,
"OpenAt": null,
"DeliveryRange": 0
},
{
"SiteId": 4,
"ExternalId": "00004",
"SiteName": "Coffee Test #4",
"AddressLine1": "801 S Figueroa St",
"City": "Los Angeles",
"State": "CA",
"Postal": "90017",
"VoicePhone": "111-111-1111",
"IsEnabled": true,
"IsLoyaltyEnabled": true,
"Latitude": 34.0478512,
"Longitude": -118.2618443,
"UserDistance": 1,
"SiteStatus": 0,
"Hours": [
{
"DayOfWeek": 0,
"OpeningTime": "08:00 AM",
"ClosingTime": "11:55 PM",
"IsClosed": false
},
{
"DayOfWeek": 1,
"OpeningTime": "11:10 PM",
"ClosingTime": "11:55 PM",
"IsClosed": false
},
{
"DayOfWeek": 2,
"OpeningTime": "11:20 PM",
"ClosingTime": "11:40 PM",
"IsClosed": false
},
{
"DayOfWeek": 3,
"OpeningTime": "06:00 PM",
"ClosingTime": "11:00 PM",
"IsClosed": false
},
{
"DayOfWeek": 4,
"OpeningTime": "06:00 PM",
"ClosingTime": "11:00 PM",
"IsClosed": false
},
{
"DayOfWeek": 5,
"OpeningTime": "06:00 PM",
"ClosingTime": "11:00 PM",
"IsClosed": false
},
{
"DayOfWeek": 6,
"OpeningTime": "06:00 PM",
"ClosingTime": "11:00 PM",
"IsClosed": false
}
],
"SpecialEvents": [],
"SupportedOrderModes": 19,
"OrderTypesSupported": [
"Pickup",
"Delivery",
"DineIn"
],
"IsWorking": false,
"OpenAt": "Open at 18:00",
"DeliveryRange": 30
},
{
"SiteId": 13,
"ExternalId": "00013",
"SiteName": "Coffee Test #13",
"AddressLine1": "6152 N Figueroa St",
"City": "Los Angeles",
"State": "CA",
"Postal": "90042",
"VoicePhone": "111-111-1111",
"IsEnabled": true,
"IsLoyaltyEnabled": true,
"Latitude": 34.1142182,
"Longitude": -118.1849929,
"UserDistance": 6,
"SiteStatus": 0,
"Hours": [
{
"DayOfWeek": 0,
"OpeningTime": "10:00 AM",
"ClosingTime": "10:00 PM",
"IsClosed": false
},
{
"DayOfWeek": 1,
"OpeningTime": "10:00 AM",
"ClosingTime": "10:00 PM",
"IsClosed": false
},
{
"DayOfWeek": 2,
"OpeningTime": "05:00 AM",
"ClosingTime": "10:00 PM",
"IsClosed": false
},
{
"DayOfWeek": 3,
"OpeningTime": "10:00 AM",
"ClosingTime": "10:00 PM",
"IsClosed": false
},
{
"DayOfWeek": 4,
"OpeningTime": "10:00 AM",
"ClosingTime": "10:00 PM",
"IsClosed": false
},
{
"DayOfWeek": 5,
"OpeningTime": "10:00 AM",
"ClosingTime": "10:00 PM",
"IsClosed": false
},
{
"DayOfWeek": 6,
"OpeningTime": "10:00 AM",
"ClosingTime": "10:00 PM",
"IsClosed": false
}
],
"SpecialEvents": [],
"SupportedOrderModes": 3,
"OrderTypesSupported": [
"Pickup",
"Delivery",
"DriveThrough"
],
"IsWorking": false,
"OpenAt": "Open at 10:00",
"DeliveryRange": 0
},
{
"SiteId": 5,
"ExternalId": "00005",
"SiteName": "Coffee Test #5",
"AddressLine1": "4946-4998 Cartwright Ave",
"City": "Los Angeles",
"State": "CA",
"Postal": "91601",
"VoicePhone": "111-111-1111",
"IsEnabled": true,
"IsLoyaltyEnabled": true,
"Latitude": 34.16075,
"Longitude": -118.3637238,
"UserDistance": 10,
"SiteStatus": 0,
"Hours": [
{
"DayOfWeek": 0,
"OpeningTime": "10:30 AM",
"ClosingTime": "09:00 PM",
"IsClosed": false
},
{
"DayOfWeek": 1,
"OpeningTime": "10:30 AM",
"ClosingTime": "09:00 PM",
"IsClosed": false
},
{
"DayOfWeek": 2,
"OpeningTime": "10:30 AM",
"ClosingTime": "09:00 PM",
"IsClosed": false
},
{
"DayOfWeek": 3,
"OpeningTime": "10:30 AM",
"ClosingTime": "09:00 PM",
"IsClosed": false
},
{
"DayOfWeek": 4,
"OpeningTime": "01:30 AM",
"ClosingTime": "02:00 AM",
"IsClosed": false
},
{
"DayOfWeek": 5,
"OpeningTime": "10:30 AM",
"ClosingTime": "09:00 PM",
"IsClosed": false
},
{
"DayOfWeek": 6,
"OpeningTime": "10:30 AM",
"ClosingTime": "09:00 PM",
"IsClosed": false
}
],
"SpecialEvents": [],
"SupportedOrderModes": 1,
"OrderTypesSupported": [
"Pickup"
],
"IsWorking": false,
"OpenAt": "Open tomorrow at 10:30",
"DeliveryRange": 0
},
{
"SiteId": 8,
"ExternalId": "00008",
"SiteName": "Coffee Test #8",
"AddressLine1": "1944-1922 Abbott St",
"City": "San Diego",
"State": "CA",
"Postal": "92107",
"VoicePhone": "111-111-1111",
"IsEnabled": true,
"IsLoyaltyEnabled": true,
"Latitude": 32.748787,
"Longitude": -117.2520815,
"UserDistance": 107,
"SiteStatus": 0,
"Hours": [
{
"DayOfWeek": 0,
"OpeningTime": "10:00 AM",
"ClosingTime": "10:00 PM",
"IsClosed": false
},
{
"DayOfWeek": 1,
"OpeningTime": "10:00 AM",
"ClosingTime": "10:00 PM",
"IsClosed": false
},
{
"DayOfWeek": 2,
"OpeningTime": "10:00 AM",
"ClosingTime": "10:00 PM",
"IsClosed": false
},
{
"DayOfWeek": 3,
"OpeningTime": "10:00 AM",
"ClosingTime": "10:00 PM",
"IsClosed": false
},
{
"DayOfWeek": 4,
"OpeningTime": "10:00 AM",
"ClosingTime": "10:00 PM",
"IsClosed": false
},
{
"DayOfWeek": 5,
"OpeningTime": "10:00 AM",
"ClosingTime": "10:00 PM",
"IsClosed": false
},
{
"DayOfWeek": 6,
"OpeningTime": "10:00 AM",
"ClosingTime": "10:00 PM",
"IsClosed": false
}
],
"SpecialEvents": [],
"SupportedOrderModes": 1,
"OrderTypesSupported": [
"Pickup"
],
"IsWorking": false,
"OpenAt": "Open at 10:00",
"DeliveryRange": 0
},
{
"SiteId": 7,
"ExternalId": "00007",
"SiteName": "Coffee Test #7",
"AddressLine1": "1898-1858 Sixth Ave",
"City": "San Diego",
"State": "CA",
"Postal": "92101",
"VoicePhone": "111-111-1111",
"IsEnabled": true,
"IsLoyaltyEnabled": true,
"Latitude": 32.7251306,
"Longitude": -117.1594056,
"UserDistance": 111,
"SiteStatus": 0,
"Hours": [
{
"DayOfWeek": 0,
"OpeningTime": "12:00 AM",
"ClosingTime": "12:00 AM",
"IsClosed": false
},
{
"DayOfWeek": 1,
"OpeningTime": "12:00 AM",
"ClosingTime": "12:00 AM",
"IsClosed": false
},
{
"DayOfWeek": 2,
"OpeningTime": "12:00 AM",
"ClosingTime": "12:00 AM",
"IsClosed": false
},
{
"DayOfWeek": 3,
"OpeningTime": "03:03 AM",
"ClosingTime": "06:06 AM",
"IsClosed": false
},
{
"DayOfWeek": 4,
"OpeningTime": "08:00 AM",
"ClosingTime": "11:00 AM",
"IsClosed": false
},
{
"DayOfWeek": 5,
"OpeningTime": "06:59 AM",
"ClosingTime": "10:59 PM",
"IsClosed": false
},
{
"DayOfWeek": 6,
"OpeningTime": "12:00 AM",
"ClosingTime": "12:00 AM",
"IsClosed": false
}
],
"SpecialEvents": [],
"SupportedOrderModes": 1,
"OrderTypesSupported": [
"Pickup"
],
"IsWorking": false,
"OpenAt": "Open at 08:00",
"DeliveryRange": 0
}
]
""".data(using: .utf8)
