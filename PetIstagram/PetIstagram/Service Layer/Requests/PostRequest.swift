//
//  PostRequest.swift
//  PetIstagram
//
//  Created by Lama Albadri on 16/03/2024.
//

import Foundation

struct PostRequest: APIResquest {
    typealias Response = [Post]
    
    var method: HTTPMethod { return .GET}
    var path: String { return "/posts"}
    var body: Data? {return nil}
    
    func handle(response: Data) throws -> [Post] {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return try decoder.decode(Response.self, from: response)
    }
}
