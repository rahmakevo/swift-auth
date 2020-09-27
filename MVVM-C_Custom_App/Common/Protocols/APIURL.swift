//
//  APIURL.swift
//  MVVM-C_Custom_App
//
//  Created by Kevin Siundu on 16/06/2020.
//  Copyright © 2020 Kevin Siundu. All rights reserved.
//

import Foundation

protocol APIURL {
    var path: String { get }
    var requestMethod: String { get }
    var bodyParams: [String: Any]? { get}
    var url: URL? { get }
    var request: URLRequest? { get }
}
