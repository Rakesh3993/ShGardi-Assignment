//
//  AppConstants.swift
//  CelebSearch
//
//  Created by Rakesh Kumar on 23/12/24.
//

import Foundation

struct AppConstants {
    static let baseURL = "https://api.themoviedb.org"
    static let API_KEY = "697d439ac993538da4e3e60b54e762cd"
    static let searchBarPlaceHolderText = "Search for Actors, Directors"
    static let navTitle = "Celebrity"
}

struct identifier {
    static let personListTableViewCell = "PersonListTableViewCell"
}

struct DateFormat {
    static func dateFormat(date: String) -> String {
        let jsonDate = date
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd"
        
        if let date = inputFormatter.date(from: jsonDate) {
            let outputFormatter = DateFormatter()
            outputFormatter.dateFormat = "dd MMM yyyy"
            let formattedDate = outputFormatter.string(from: date)
            return formattedDate
        } else {
            return "nil"
        }
    }
}
