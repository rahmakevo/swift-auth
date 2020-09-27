//
//  ValidationRule.swift
//  MVVM-C_Custom_App
//
//  Created by Kevin Siundu on 16/06/2020.
//  Copyright © 2020 Kevin Siundu. All rights reserved.
//

import Foundation

protocol ValidationRule {
    func invalidMessage(forLabel name: String) -> String
    func apply<T>(to input: T) -> Bool
}
