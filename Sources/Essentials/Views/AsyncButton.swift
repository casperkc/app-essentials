//
//  SwiftUIView.swift
//  
//
//  Created by Casper Kønigsfeldt on 06/10/2023.
//

import SwiftUI

public struct AsyncButton<Label: View>: View {
    var action: () async -> Void
    var actionOptions = Set(ActionOption.allCases)
    
    @ViewBuilder var label: () -> Label

    @State private var isDisabled = false

    public var body: some View {
        Button(
            action: {
                if actionOptions.contains(.disableButton) {
                    isDisabled = true
                }
            
                Task {
                    await action()
                    isDisabled = false
                }
            },
            label: {
                label()
            }
        )
        .disabled(isDisabled)
    }
}

extension AsyncButton {
    enum ActionOption: CaseIterable {
        case disableButton
    }
}

extension AsyncButton where Label == Text {
    init(_ label: String, actionOptions: Set<ActionOption> = Set(ActionOption.allCases), action: @escaping () async -> Void) {
        self.init(action: action) {
            Text(label)
        }
    }
}

extension AsyncButton where Label == Image {
    init(systemImageName: String, actionOptions: Set<ActionOption> = Set(ActionOption.allCases), action: @escaping () async -> Void) {
        self.init(action: action) {
            Image(systemName: systemImageName)
        }
    }
}

#Preview {
    NavigationStack {
        VStack {
            AsyncButton("Test", action: {})
        }
        .frame(minWidth: 200, minHeight: 200)
        .navigationTitle("Async button")
    }
}
