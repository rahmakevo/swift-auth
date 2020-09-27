//
//  FormSection.swift
//  MVVM-C_Custom_App
//
//  Created by Kevin Siundu on 16/06/2020.
//  Copyright © 2020 Kevin Siundu. All rights reserved.
//

import Foundation

struct FormSection {
    let id: Int
    let title: String?
    var titleStyle: TitleStyle = .mainHeader
    var subtitle: String = ""
    var subtitleStyle: TitleStyle = .mainSubheader
    var cells: [FormField]
}
