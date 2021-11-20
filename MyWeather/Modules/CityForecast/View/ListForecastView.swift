//
//  ListForecastView.swift
//  MyWeather
//
//  Created by Gia Nguyen on 13/11/2021.
//

import SwiftUI

struct ListForecastView: View {
    private var models = [ "a", "b", "c" ]
    @State private var searchText = ""
    @State private var showCancelButton: Bool = false

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    HStack {
                        Image(systemName: "magnifyingglass")

                        TextField("Enter city name", text: $searchText, onEditingChanged: { isEditing in
                            self.showCancelButton = true
                        }, onCommit: {
                        }).foregroundColor(.primary)

                        Button(action: {
                            self.searchText = ""
                        }) {
                            Image(systemName: "xmark.circle.fill").opacity(searchText == "" ? 0 : 1)
                        }
                    }
                    .padding(EdgeInsets(top: 12, leading: 8, bottom: 12, trailing: 8))
                    .foregroundColor(.secondary)
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(10.0)

                    if showCancelButton  {
                        Button("Cancel") {
                                UIApplication.shared.endEditing(true) // this must be placed before the other commands here
                                self.searchText = ""
                                self.showCancelButton = false
                        }
                        .foregroundColor(Color(.systemBlue))
                    }
                }
                .padding(EdgeInsets(top: 2, leading: 16, bottom: 8, trailing: 16)).animation(.default)

                List {
//                    ForEach(array.filter{$0.hasPrefix(searchText) || searchText == ""}, id:\.self) {
//                        searchText in Text(searchText)
//                    }
                    ForEach(models, id:\.self) { item in
                        ItemCityForecastView()
                    }
                    
                }
                .listStyle(.plain).environment(\.defaultMinListRowHeight, 150)
            }
            .navigationBarTitle(Text("Weather Forecast"))
            .navigationBarTitleDisplayMode(.inline)
            .resignKeyboardOnDragGesture()
        }
        .background(Color.init(UIColor.systemGray3))
    }
}

struct ListForecastView_Previews: PreviewProvider {
    static var previews: some View {
        ListForecastView()
          .environment(\.colorScheme, .light)
//
//            ListForecastView()
//              .environment(\.colorScheme, .dark)
    }
}
