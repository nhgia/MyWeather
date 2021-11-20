//
//  NetworkRequest.swift
//  MyWeather
//
//  Created by Gia Nguyen on 20/11/2021.
//

import Foundation
import Alamofire
class NetworkRequest<GenericType: Decodable> {
    let sessionManager: Session = {
        let configuration = URLSessionConfiguration.af.default
        configuration.timeoutIntervalForRequest = 10
        
        return Session(configuration: configuration)
    }()
    
    func request(endpoint: NetworkEndpoint, handlerResponse: ((_ responseObject: GenericType?,_ errorObject: Error?) -> Void)?) {
        guard let _url = endpoint.url else {
            print("URL is incorrect")
            return
        }
        
        sessionManager.request(_url, method: endpoint.method, parameters: endpoint.queryParameters, headers: endpoint.headerParamaters).responseDecodable(of: GenericType.self) { response in
            switch response.result {
            case .success(let _data):
                handlerResponse?(_data, nil)
            case .failure(let err):
                handlerResponse?(nil, err)
            }
        }
    }
}
