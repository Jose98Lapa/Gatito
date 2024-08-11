//
//  CodableWrapper.swift
//  Gatito
//
//  Created by José Miguel Lapa on 11/08/2024.
//

import Foundation

struct CodableWrapper {
    
    static func decode<T:Decodable>(_ type: T.Type, from jsonObject: [String: Any]) throws -> T {
        let data = try JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted)
        return try JSONDecoder().decode(type, from: data)
    }
}
