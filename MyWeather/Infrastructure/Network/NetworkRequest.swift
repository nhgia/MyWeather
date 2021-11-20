//
//  NetworkRequest.swift
//  MyWeather
//
//  Created by Gia Nguyen on 20/11/2021.
//

import Foundation
import Alamofire
class NetworkRequest {
    let sessionManager: Session = {
        let configuration = URLSessionConfiguration.af.default
        configuration.timeoutIntervalForRequest = 10
        
        return Session(configuration: configuration)
    }()
    
    func request<Type: Decodable>(endpoint: NetworkEndpoint, handlerResponse: ((_ responseObject: Type?,_ errorObject: Error?) -> Void)?) {
        guard let _url = endpoint.url else {
            print("URL is incorrect")
            return
        }
        
        sessionManager.request(_url, method: endpoint.method, parameters: endpoint.queryParameters, encoding: JSONEncoding.default, headers: endpoint.headerParamaters).validate().responseData { response in
            switch response.result {
            case .success(let _data):
                do {
                    let decoder = JSONDecoder()
                    let objectResponse = try decoder.decode(Type.self, from: _data)
                    handlerResponse?(objectResponse, nil)
                }
                catch let err {
                    handlerResponse?(nil, err)
                }
            case .failure(let err):
                handlerResponse?(nil, err)
            }
        }
    }
}
