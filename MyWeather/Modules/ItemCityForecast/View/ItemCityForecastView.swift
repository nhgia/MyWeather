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
            HStack {
                VStack(alignment: .leading, spacing: 6.0) {
                    Text(viewModel.dateString)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(viewModel.avgTemp)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(viewModel.pressure)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(viewModel.humid)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(viewModel.desc)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .frame(width: geometry.size.width * 0.75)
                .padding(EdgeInsets(top: 12, leading: 12, bottom: 12, trailing: 0))
                
                KFImage(URL(string: viewModel.icon)).placeholder {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .black))
                        .scaleEffect(1)
                }
                .cancelOnDisappear(true)
                .cacheMemoryOnly()
                .resizable()
                .aspectRatio(1, contentMode: .fit)
                .frame(width: geometry.size.width * 0.15)
                .clipped()
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
        return ItemCityForecastView(forecastModel: ItemCityForecastModel(), timeZone: TimeZone.current, currentUnit: .celsius)
          .environment(\.colorScheme, .light).previewLayout(.fixed(width: 400, height: 180))
    }
}
