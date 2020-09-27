//
//  UIView+fromNib.swift
//  MVVM-C_Custom_App
//
//  Created by Kevin Siundu on 16/06/2020.
//  Copyright © 2020 Kevin Siundu. All rights reserved.
//

import UIKit

extension UIView {

    class func fromNib<T: UIView>() -> T {
        guard let view = Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil)?[0] as? T else {
            fatalError("could not load Nib from bundle using fromNib()")
        }
        return view
    }
}
