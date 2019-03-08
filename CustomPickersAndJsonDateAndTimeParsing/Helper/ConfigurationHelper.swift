//
//  ConfigurationHelper.swift
//  CustomPickersAndJsonDateAndTimeParsing
//
//  Created by Malovic, Milos on 3/6/19.
//  Copyright © 2019 Malovic, Milos. All rights reserved.
//


import Foundation

internal func Init<Type>(_ value: Type, block: (_ object: Type) -> Void) -> Type {
    block(value)
    return value
}
