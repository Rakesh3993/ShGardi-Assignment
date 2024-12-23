//
//  PersonModel.swift
//  CelebSearch
//
//  Created by Rakesh Kumar on 23/12/24.
//

import Foundation

struct PersonModel: Codable {
    let results: [PersonResults]
}

struct PersonResults: Codable {
    let name: String?
    let original_name: String?
    let id: Int?
}
