//
//  APIClient.swift
//  SportPlayer
//
//  Created by Lukasz Dziwosz on 05/10/2021.
//

import Foundation

struct APIClient {
    
    enum APIError: Error {
         case invalidURL
         case missingData
     }
     
    static func fetchData(completion: @escaping (Result<[Event], Error>) -> Void) {
         
         guard let url = URL(string: "https://us-central1-dazn-sandbox.cloudfunctions.net/getEvents") else {
             completion(.failure(APIError.invalidURL))
             return
         }
         
         URLSession.shared.dataTask(with: url) { data, _, error in

             if let error = error {
                 completion(.failure(error))
                 return
             }
             
             guard let data = data else {
                 completion(.failure(APIError.missingData))
                 return
             }
             
             do {
                 let result = try JSONDecoder().decode([Event].self, from: data)
                 completion(.success(result))
             } catch {
                 completion(.failure(error))
             }
             
         }.resume()
     }
}
