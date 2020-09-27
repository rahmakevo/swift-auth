//
//  HomeViewModel.swift
//  MVVM-C_Custom_App
//
//  Created by Kevin Siundu on 16/06/2020.
//  Copyright © 2020 Kevin Siundu. All rights reserved.
//

import Foundation
import UIKit

final class HomeViewModel: FormViewModel {
    
    override init() {
        super.init()
        
        var cells: [FormField] = []
        self.sections = [
            FormSection(
                id: 0,
                title: nil,
                cells: cells
            )
        ]
    }
    
}
