//
//  SiteServices.swift
//  CustomPickersAndJsonDateAndTimeParsing
//
//  Created by Malovic, Milos on 3/6/19.
//  Copyright © 2019 Malovic, Milos. All rights reserved.
//

import Foundation
import UIKit

struct SiteServices {
    
    static func getSitesNearBy (completion: @escaping ((Any) -> Void)) {
        do {
            let nearBySites = try JSONDecoder().decode([Sites].self, from: jsonData!)
            DataManager.shared.sitesDataManager = nearBySites.map({$0})
            completion(nearBySites)
        } catch {
            let alert = UIAlertController(title: "Error", message: "Something went wrong.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            completion(alert)
        }
    }
}
