//
//  Schedule.swift
//  SportPlayer
//
//  Created by Lukasz Dziwosz on 05/10/2021.
//

import Foundation

enum Section {
    case main
}

struct Schedule: Codable, Hashable {
    var id: String
    var title: String
    var subtitle: String
    var date: String
    var imageUrl: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
      }
    static func == (lhs: Schedule, rhs: Schedule) -> Bool {
        lhs.id == rhs.id
    }
}
