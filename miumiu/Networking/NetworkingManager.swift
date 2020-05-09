//
//  NetworkingManager.swift
//  miumiu
//
//  Created by Steven Vovchyna on 09.05.2020.
//  Copyright © 2020 Steven Vovchyna. All rights reserved.
//

import UIKit

class NetworkingManager {
    
    static let shared = NetworkingManager()
    
    enum RequestResult<T> {
        case success(T)
        case failure
    }
    
    let apiKey : String = "d196a494-3115-474c-a82f-bfca8ee1f463"
    let baseURLString: String = "https://api.thecatapi.com/v1/"

    func getBreedsList(done: @escaping (RequestResult<[Breed]>) -> ()) {
        let url = URL(string: baseURLString + "breeds")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("\(apiKey)", forHTTPHeaderField: "apiKey")
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if error != nil {
                return done(.failure)
            }
            guard let respons = response as? HTTPURLResponse, (200...299).contains(respons.statusCode) else {
                return done(.failure)
            }
            if let data = data {
                do {
                    let answer = try JSONDecoder().decode([Breed].self, from: data)
                    done(.success(answer))
                } catch {
                    print(error)
                    done(.failure)
                }
            } else {
                done(.failure)
            }
        }
        task.resume()
    }
    
    func getBreedImageLink(breedID: String, done: @escaping (RequestResult<String>) -> ()) {
        let url = URL(string: baseURLString + "images/search?size=thumb&limit=1&breed_id=\(breedID)")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("\(apiKey)", forHTTPHeaderField: "apiKey")
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if error != nil {
                return done(.failure)
            }
            guard let respons = response as? HTTPURLResponse, (200...299).contains(respons.statusCode) else {
                return done(.failure)
            }
            if let data = data {
                do {
                    let answer = try JSONDecoder().decode([BreedImage].self, from: data)
                    done(.success(answer[0].url ?? ""))
                } catch {
                    print(error)
                    done(.failure)
                }
            } else {
                done(.failure)
            }
        }
        task.resume()
    }
    
    func getBreedImage(url: String, done: @escaping (RequestResult<UIImage>) -> ()) {
        let url = URL(string: url)!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.cachePolicy = .useProtocolCachePolicy
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if error != nil {
                return done(.failure)
            }
            guard let respons = response as? HTTPURLResponse, (200...299).contains(respons.statusCode) else {
                return done(.failure)
            }
            if let data = data {
                guard let image = UIImage(data: data) else { return done(.failure)}
                done(.success(image))
            } else {
                done(.failure)
            }
        }
        task.resume()
    }
}
