//
//  NetworkManager.swift
//  FootballStandings
//
//  Created by Никита Горбунов on 12.07.2022.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private let api = "https://api-football-standings.azharimm.site/leagues"
    
    private init() {}
    
    func fetchData(completion: @escaping (_ leagues: [Leagues]) -> Void) {
        guard let url = URL(string: api) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No Discription")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let courses = try decoder.decode([Leagues].self, from: data)
                DispatchQueue.main.async {
                    completion(courses)
                }
            } catch let error {
                print("Error serialization json", error)
            }
            
        }.resume()
    }
}

//class NetworkManager {
//
//    private let urlString = "https://api-football-standings.azharimm.site/leagues"
//
//    func fetchLeagues(completion: @escaping (Result<League, Error>) -> Void) {
//
//
//        guard let url = URL(string:  urlString) else { return }
//
//        URLSession.shared.dataTask(with: url) { data, _, error in
//            if let error = error {
//                completion(.failure(error))
//                return
//            }
//
//            guard let responseData = data else { return }
//
//            do {
//                let league = try JSONDecoder().decode(League.self, from: responseData)
//                completion(.success(league))
//            } catch {
//                completion(.failure(error))
//            }
//        }.resume()
//    }
//}
