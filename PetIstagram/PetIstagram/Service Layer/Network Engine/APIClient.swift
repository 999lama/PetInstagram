//
//  APIClient.swift
//  PetIstagram
//
//  Created by Lama Albadri on 16/03/2024.
//

import Foundation
import Combine


enum APIError: Error {
    case requestFailed(Int)
    case postProcessingFailed(Error?)
}

struct APIClient {
    
    let session: URLSession
    let enviroment: APIEnviroment
    
    init(session: URLSession = .shared, enviroment: APIEnviroment = .prod) {
        self.session = session
        self.enviroment = enviroment
    }
    
    func publisherForRequest<T: APIResquest>(_ request: T) -> AnyPublisher<T.Response, Error> {
        // create url request from the envoirment
        let url = enviroment.baseUrl.appendingPathComponent(request.path)
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.method.rawValue
        urlRequest.httpBody = request.body
        
        // get data task publisher from urlSession
        let publisher = session.dataTaskPublisher(for: urlRequest)
            .tryMap { data, response -> Data in
                guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
                    let statusCode = (response as? HTTPURLResponse)?.statusCode ?? 0
                        // if it's not in 200 range we will throw an error
                    throw APIError.requestFailed(statusCode)
                }
                // else return the data
                return data
            }
            .tryMap { data -> T.Response in
                try request.handle(response: data)
            }
            .tryCatch { error -> AnyPublisher<T.Response, APIError> in
                throw APIError.postProcessingFailed(error)
            }
        
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
        
        return publisher
    }
    
    
    
}
