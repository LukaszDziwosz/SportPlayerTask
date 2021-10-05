//
//  EventModel.swift
//  SportPlayer
//
//  Created by Lukasz Dziwosz on 05/10/2021.
//

import Foundation

struct Event: Codable {
    let id: String
    let title: String
    let subtitle: String
    let date: String
    let imageUrl: String
    let videoUrl: String
}
