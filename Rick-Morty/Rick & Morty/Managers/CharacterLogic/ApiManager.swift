//
//  ApiManager.swift
//  Rick & Morty
//
//  Created by Admin on 06.06.2023.
//

import Foundation

class APIManager {
    static let shared = APIManager()
    
    let urlString = "https://rickandmortyapi.com/api/character"
    
    func getData(completion: @escaping ([Result]) -> Void) {
        let url = URL(string: urlString)!
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { data,response,error in
            guard let data else {
                return
            }
            if let ourData = try? JSONDecoder().decode(CharacterData.self, from: data) {
                completion(ourData.results)
                print(ourData.results[0].name)
            }
            else {
                print("Fail")
            }
           
        }
        task.resume()
    }
}
