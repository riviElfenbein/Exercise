//
//  NetworkingWorker.swift
//  Exercise
//
//  Created by Rivi Elf on 05/11/2020.
//

import Foundation

class NetworkingWorker {
    func performNetworkTask<T: Codable>(endpoint: String,
                                         type: T.Type,
                                        completion: ((_ response: T) -> Void)?) {
        guard let url = URL(string: endpoint) else {
            return
        }
        let urlRequest = URLRequest(url: url)

        let urlSession = URLSession.shared.dataTask(with: urlRequest) { (data, urlResponse, error) in
            if let _ = error {
                return
            }
            guard let data = data else {
                return
            }
            let response = Response(data: data)
            
                guard let decoded = response.decode(type) else {
                    return
                }
                completion?(decoded)
        }

        urlSession.resume()
    }
    
    func loadImage(path: String, completion: @escaping (Data?) -> ()){
        guard let imgURL = URL(string: path) else {
            completion(nil)
            return
        }
        let request: URLRequest = URLRequest(url: imgURL)
        let task =  URLSession.shared.dataTask(with: request, completionHandler: {data, response, error -> Void in
            let data = data
            completion(data)
        })
        task.resume()
    }
    
    
}
