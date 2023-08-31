//
//  ImageCashe.swift
//  avito test app
//
//  Created by stargaltion on 8/30/23.
//

import UIKit

class ImageCache {
    static let shared = ImageCache()
    private let cache = NSCache<NSString, UIImage>()

    func image(for url: URL, completion: @escaping (UIImage?) -> Void) {

        if let image = cache.object(forKey: url.absoluteString as NSString) {
            completion(image)
            return
        }

        let task = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            guard let data = data, let image = UIImage(data: data) else {
                completion(nil)
                return
            }
            
            self?.cache.setObject(image, forKey: url.absoluteString as NSString)
            completion(image)
        }
        task.resume()
    }
}
