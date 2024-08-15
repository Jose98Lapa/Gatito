//
//  HTTPConfiguration.swift
//  Gatito
//
//  Created by José Miguel Lapa on 15/08/2024.
//

import Foundation

enum HTTPMethod: String {
    case POST, GET, PUT, DELETE
}

enum HTTPBodyConfiguration: String {
    case urlEncoded = "application/x-www-form-urlencoded; charset=utf-8"
    case Json = "application/json; charset=utf-8"
}

enum HTTPCode {
    
    case Success
    case Failure
    
    init(_ code: Int) {
        switch code {
        case 200..<299: self = .Success
        default: self = .Failure
        }
    }
}
