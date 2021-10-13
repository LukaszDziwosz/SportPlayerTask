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

struct Shedule: Codable, Hashable {
    let id: String
    let title: String
    let subtitle: String
    let date: String
    let imageUrl: String
}
