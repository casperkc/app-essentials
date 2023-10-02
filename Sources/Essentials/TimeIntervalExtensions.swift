//
//  File.swift
//  
//
//  Created by Casper Kønigsfeldt on 02/10/2023.
//

import Foundation

extension TimeInterval {
    var seconds: Int {
        return Int(self) % 60
    }

    var minutes: Int {
        return (Int(self) / 60 ) % 60
    }

    var hours: Int {
        return Int(self) / 3600
    }
}
