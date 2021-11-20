//
//  ItemCityForecastView.swift
//  MyWeather
//
//  Created by Gia Nguyen on 19/11/2021.
//

import SwiftUI
import Kingfisher

struct ItemCityForecastView: View {
    @StateObject private var viewModel: ItemCityForecastViewModel
    
    var body: some View {
        GeometryReader { geometry in
            HStack{
                VStack(alignment: .leading, spacing: 6.0) {
                    Text(viewModel.dateString).frame(maxWidth: .infinity, alignment: .leading)
                    Text(viewModel.avgTemp).frame(maxWidth: .infinity, alignment: .leading)
                    Text(viewModel.pressure).frame(maxWidth: .infinity, alignment: .leading)
                    Text(viewModel.humid).frame(maxWidth: .infinity, alignment: .leading)
                    Text(viewModel.desc).frame(maxWidth: .infinity, alignment: .leading)
                }.padding(EdgeInsets(top: 12, leading: 12, bottom: 12, trailing: 12)).frame(width: geometry.size.width * 0.75)
                
                let defaultImage = Image(systemName: "cloud.heavyrain").resizable().aspectRatio(1, contentMode: .fit).frame(width: geometry.size.width * 0.1)
                KFImage(URL(string: viewModel.icon)).resizable().aspectRatio(1, contentMode: .fit).frame(width: geometry.size.width * 0.1)
            }
        }.background(Color.init(UIColor.systemGray3))
    }
    
    init(forecastModel: ItemCityForecastModel, timeZone: TimeZone, currentUnit: UnitType) {
        let itemViewModel = ItemCityForecastViewModel(forecastModel: forecastModel, timeZone: timeZone, currentUnit: currentUnit)
        _viewModel = StateObject(wrappedValue: itemViewModel)
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
