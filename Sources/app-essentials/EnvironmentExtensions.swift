//
//  File.swift
//  
//
//  Created by Casper Kønigsfeldt on 02/10/2023.
//

import SwiftUI

public struct PrefersTabNavigationEnvironmentKey: EnvironmentKey {
    public static var defaultValue: Bool = false
}

extension EnvironmentValues {
    var prefersTabNavigation: Bool {
        get { self[PrefersTabNavigationEnvironmentKey.self] }
        set { self[PrefersTabNavigationEnvironmentKey.self] = newValue }
    }
}
