//
//  APIEnviroment.swift
//  PetIstagram
//
//  Created by Lama Albadri on 16/03/2024.
//

import Foundation

struct APIEnviroment {
    
    var baseUrl: URL
}

extension APIEnviroment {
    static let prod = APIEnviroment(baseUrl: URL(string: "https://example.com/api/v1")!)
    static let local = APIEnviroment(baseUrl: URL(string: "https://localhost:8080/api/v1")!)
}
