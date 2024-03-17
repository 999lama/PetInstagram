//
//  Post.swift
//  PetIstagram
//
//  Created by Lama Albadri on 16/03/2024.
//

import Foundation


struct Post: Decodable {
    var caption: String
    var createdAt: Date
    var photoUrl: URL
}
