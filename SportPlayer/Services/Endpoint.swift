//
//  Endpoint.swift
//  SportPlayer
//
//  Created by Lukasz Dziwosz on 10/10/2021.
//

import Foundation

enum Endpoint {
  case event
  case schedule
}
protocol RequestProviding {
  var urlRequest: URLRequest { get }
}

extension Endpoint: RequestProviding {
  var urlRequest: URLRequest {
    switch self {
    case .event:
        guard let url = URL(string: "https://us-central1-dazn-sandbox.cloudfunctions.net/getEvents") else {
          preconditionFailure("Invalid URL used to create URL instance")}
          return URLRequest(url: url)
    case .schedule:
        guard let url = URL(string: "https://us-central1-dazn-sandbox.cloudfunctions.net/getSchedule") else {
          preconditionFailure("Invalid URL used to create URL instance")}
          return URLRequest(url: url)
        }
    }
}
