//
//  UIApplication+.swift
//  MyWeather
//
//  Created by Gia Nguyen on 18/11/2021.
//

import SwiftUI

extension UIApplication {
    func endEditing(_ force: Bool) {
        self.windows
            .filter{$0.isKeyWindow}
            .first?
            .endEditing(force)
    }
}
