//
//  ArticelEntity.swift
//  Exercise
//
//  Created by Rivi Elf on 06/11/2020.
//

import Foundation

struct Articels: Codable {
    var data: [ArticelEntity]
}


struct ArticelEntity: Codable {
    var title: String
    var imageUrl: String
    //var creationTime: String
    var category: String
    var author: Author
   
}

struct Author: Codable {
    var authorName:String
}
