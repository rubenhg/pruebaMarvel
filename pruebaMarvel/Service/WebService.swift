//
//  WebService.swift
//  pruebaMarvel
//
//  Created by ruben on 04/03/2021.
//  Copyright © 2021 ruben. All rights reserved.
//

import Foundation
import UIKit
import CryptoKit


enum error: Error {
    case noHayDatos
    case noHayDatosAProcesar
}

struct WebService {
    
    static let publicKey = "1e22fad1f056602ee2a8f259b4c9ab5a"
    static let privateKey = "40c0a26ccce4824058d6cd03a2f3f23483ef0454"
    let resourceURL: URL
    
    init(offset: Int) {
        let ts = NSDate().timeIntervalSince1970
        let hash = MD5(string: "\(ts)\(WebService.privateKey)\(WebService.publicKey)")
        
        let resourceString = "https://gateway.marvel.com/v1/public/characters?limit=100&offset=\(offset)&ts=\(ts)&apikey=\(WebService.publicKey)&hash=\(hash)"
        
        let urlResourceString = resourceString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        
        guard let resourceURL = URL(string: urlResourceString) else { fatalError() }
        
        self.resourceURL = resourceURL
        
    }
    
    
    func getCharacters(completionHandler: @escaping(Result<([Character], Int), error>) -> Void) {
        
        let dataTask = URLSession.shared.dataTask(with: resourceURL) { (data, _, _) in
            
            guard let jsonData = data else {
                completionHandler(.failure(.noHayDatos))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                
                let response = try decoder.decode(Response.self, from: jsonData)
                completionHandler(.success((response.data.results, response.data.total)))
                
            } catch {
                completionHandler(.failure(.noHayDatosAProcesar))
            }
        }
        dataTask.resume()
    }
    
 
}

func MD5(string: String) -> String {
     let digest = Insecure.MD5.hash(data: string.data(using: .utf8) ?? Data())

     return digest.map {
         String(format: "%02hhx", $0)
     }.joined()
 }
