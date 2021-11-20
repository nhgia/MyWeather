//
//  ItemCityForecastView.swift
//  MyWeather
//
//  Created by Gia Nguyen on 19/11/2021.
//

import SwiftUI
struct ItemCityForecastView: View {
    var body: some View {
        GeometryReader { geometry in
            HStack{
                VStack(alignment: .leading, spacing: 6.0) {
                    Text("Date: Thu, 10 Jun 2021").frame(maxWidth: .infinity, alignment: .leading)
                    Text("Average Temperature: 30°C").frame(maxWidth: .infinity, alignment: .leading)
                    Text("Pressure: 1018").frame(maxWidth: .infinity, alignment: .leading)
                    Text("Humidity: 62%").frame(maxWidth: .infinity, alignment: .leading)
                    Text("Description: sky is clear").frame(maxWidth: .infinity, alignment: .leading)
                }.padding(EdgeInsets(top: 12, leading: 12, bottom: 12, trailing: 12)).frame(width: geometry.size.width * 0.75)
                Image(systemName: "cloud.heavyrain").resizable().aspectRatio(1, contentMode: .fit).frame(width: geometry.size.width * 0.1)
            }
        }.background(Color.init(UIColor.systemGray3))
    }
}

struct ItemCityForecast_Previews: PreviewProvider {
    static var previews: some View {
        ItemCityForecastView()
          .environment(\.colorScheme, .light).previewLayout(.fixed(width: 400, height: 150))
        ItemCityForecastView()
          .environment(\.colorScheme, .dark).previewLayout(.fixed(width: 400, height: 150))
    }
}
