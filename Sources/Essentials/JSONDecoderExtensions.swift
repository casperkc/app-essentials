//
//  File.swift
//  
//
//  Created by Casper Kønigsfeldt on 03/10/2023.
//

import Foundation

extension JSONDecoder {
    func decode<T: Decodable>(_ type: T.Type, from data: Data, key: String) throws -> T {
        let root = try JSONSerialization.jsonObject(with: data)
        
        if let nestedJson = (root as AnyObject).value(forKeyPath: key) {
            let nestedJsonData = try JSONSerialization.data(withJSONObject: nestedJson)
            
            return try decode(type, from: nestedJsonData)
        }
        else {
            throw CustomErrors.keyPathError
        }
    }
}
