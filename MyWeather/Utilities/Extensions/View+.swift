//
//  View+.swift
//  MyWeather
//
//  Created by Gia Nguyen on 18/11/2021.
//

import SwiftUI
extension View {
    func resignKeyboardOnDragGesture() -> some View {
        return modifier(ResignKeyboardOnDragGesture())
    }
}
