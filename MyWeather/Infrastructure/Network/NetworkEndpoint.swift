//
//  NetworkEndpoint.swift
//  MyWeather
//
//  Created by Gia Nguyen on 20/11/2021.
//

import Foundation
import Alamofire

class NetworkEndpoint {
    var method: HTTPMethod
    var url: URL?
    var headerParamaters: HTTPHeaders?
    var queryParameters: Parameters?
    var bodyParamaters: Parameters?
    
    init(method: HTTPMethod = .post, path: String, isFullPath: Bool, headerParamaters: HTTPHeaders? = nil, queryParameters: Parameters? = nil, bodyParamaters: Parameters? = nil) {
        self.method = method
        self.headerParamaters = headerParamaters
        self.queryParameters = queryParameters
        self.bodyParamaters = bodyParamaters
        
        if isFullPath {
            self.url = URL(string: path)
        }
        else {
            guard let serverBaseUrl = ConfigKey.infoForKey("Backend Base URL") else {
                fatalError("Cannot get server URL, please check the .xcconfig & info.plist file")
            }
            let urlPath:String = serverBaseUrl + path
            self.url = URL(string: urlPath)
        }
    }
}
