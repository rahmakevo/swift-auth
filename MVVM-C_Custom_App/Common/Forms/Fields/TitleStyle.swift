//
//  TitleStyle.swift
//  MVVM-C_Custom_App
//
//  Created by Kevin Siundu on 16/06/2020.
//  Copyright © 2020 Kevin Siundu. All rights reserved.
//

import Foundation
import UIKit

enum TitleStyle {

    case mainHeader
    case mainSubheader
    case secondaryHeader

    func configure(_ view: UILabel) {
        switch self {
        case .mainHeader: view.styleAsMainHeader()
        case .secondaryHeader: view.styleAsSecondaryHeader()
        case .mainSubheader: view.styleAsMainSubheader()
        default:
            view.styleAsMainHeader()
        }
    }
}
