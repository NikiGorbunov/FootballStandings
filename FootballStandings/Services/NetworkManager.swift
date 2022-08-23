//
//  NetworkManager.swift
//  FootballStandings
//
//  Created by Никита Горбунов on 12.07.2022.
//

import Foundation

class NetworkManager {
    private let urlString = "https://api-football-standings.azharimm.site/leagues"
    
    func fetchLeagues(completion: @escaping (Result<Leagues?, Error>) -> Void) {
        
        
        guard let url = URL(string:  urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let responseData = data else { return }
            
            do {
                let league = try JSONDecoder().decode(Leagues.self, from: responseData)
                completion(.success(league))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
