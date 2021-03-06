//
//  NetworkService.swift
//  redTeamSprint3
//
//  Created by Aleksey Shepelev on 22/11/2019.
//  Copyright © 2019 redTeam. All rights reserved.
//

import Foundation
import UIKit

class NetworkService {
    
    private let apiKey = "13551591-fd8c90cad7f3870d5b2e67584"
    private var downloadLink : String {
        return "https://pixabay.com/api/?key=\(apiKey)&image_type=photo&per_page=100"
    }
    
    func get(_ completion: @escaping (Bool) -> Void) {
        getResponse(completion: { imagesData in
            guard let imagesData = imagesData else {
                DispatchQueue.main.async {
                     completion(false)
                }
                return
            }
            let queue = DispatchQueue(label: "", attributes: .concurrent)
            queue.async {
                let group = DispatchGroup()
                for imageData in imagesData {
                    var smallImageData : Data!
                    var largeImageData : Data!
                    group.enter()
                    self.downloadImageData(by: URL(string: imageData.previewURL)!, with: { data in
                        smallImageData = data
                        self.downloadImageData(by: URL(string: imageData.largeImageURL)!, with: { data in
                            largeImageData = data
                            CoreDataService().saveImage(smallImageData: smallImageData, largeImageData: largeImageData)
                            group.leave()
                        })
                    })
                }
                group.notify(queue: DispatchQueue.main) {
                    print("Images have been downloaded")
                    completion(true)
                }
            }
        })
    }
    
    private func getResponse(completion: @escaping ([ImageData]?) -> Void) {
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let url = URL(string: downloadLink)!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData)
        let task = session.dataTask(with: request) { data, response, error in
            if let data = data {
                do {
                    let responseObj = try JSONDecoder().decode(Response.self, from: data)
                    print("Pespond gotten")
                    completion(responseObj.hits)
                } catch {
                    print(error)
                }
            } else {
                print("Empty data")
                completion(nil)
            }
        }
        task.resume()
    }
    
    private func downloadImageData(by url : URL, with completion: @escaping (Data) -> Void) {
        let session = URLSession.shared
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData)
        let task = session.dataTask(with: request) { data, response, error in
            guard let imageData = data else {
                print("Could not created image from downloaded data")
                return
            }
            completion(imageData)
        }
        task.resume()
    }
}
