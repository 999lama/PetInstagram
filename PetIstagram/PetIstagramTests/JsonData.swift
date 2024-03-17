//
//  JsonData.swift
//  PetIstagramTests
//
//  Created by Lama Albadri on 16/03/2024.
//

import Foundation

enum JsonData {
    static let goodFeed = """
[
{
"photoUrl: "/photos/image1.jpg",
"createdAt: "2020-04-01T12:00:00Z",
"caption: "Living her best life! "
},
{
"photoUrl: "/photos/image1.jpg",
"createdAt: "2020-04-01T12:00:00Z",
"caption: "Living her best life! "
},
{
"photoUrl: "/photos/image1.jpg",
"createdAt: "2020-04-01T12:00:00Z",
"caption: "Living her best life! "
}
]

"""
    
    static let badJson = """
[
bad

]

"""
 
 
}
