//
//  ApiManager.swift
//  avito test app
//
//  Created by stargaltion on 8/30/23.
//

import Foundation
import UIKit

class ApiManager {
    
    func loadProducts(completion: @escaping ([Product])->Void) {
        var products = [Product]()
        let url = URL(string: "https://www.avito.st/s/interns-ios/main-page.json")
        URLSession.shared.dataTask(with: url!) {(data, response, error) in
            if let data = data,
               let response = try? JSONDecoder().decode(Products.self, from: data) {
                products = response.advertisements
                completion(products)
            } else {
                print(error?.localizedDescription ?? "Error")
            }
        }.resume()
        
    }
    
    func loadImage(from url: String, completion: @escaping (UIImage?) -> Void) {
        if let url = URL(string: url) {
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard let data = data, error == nil, let image = UIImage(data: data) else {
                    completion(nil)
                    return
                }
                completion(image)
            }
            task.resume()
        }
    }
}
