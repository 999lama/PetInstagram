//
//  APIRequest.swift
//  PetIstagram
//
//  Created by Lama Albadri on 16/03/2024.
//

import Foundation

enum HTTPMethod: String {
    case GET
    case POST
    case PUT
}

protocol APIResquest {
    associatedtype Response
    var method: HTTPMethod { get }
    var path: String { get }
    var body: Data? { get }

    func handle(response: Data) throws -> Response
}
