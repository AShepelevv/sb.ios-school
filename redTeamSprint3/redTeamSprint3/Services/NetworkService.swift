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
    
    func get(_ completion: () -> Void = {}) {
        let group = DispatchGroup()
        group.enter()
        getResponse(completion: { imagesData in
            for (i, imageData) in imagesData.enumerated() {
                var smallImageData : Data!
                var largeImageData : Data!
                group.enter()
                let queue = DispatchQueue(label: "")
                queue.async {
                    let subgroup = DispatchGroup()
                    subgroup.enter()
                    print("Start (\(i))")
                    self.downloadImageData(by: URL(string: imageData.previewURL)!, with: { data in
                        smallImageData = data
                        subgroup.leave()
                    })
                    subgroup.enter()
                    self.downloadImageData(by: URL(string: imageData.largeImageURL)!, with: { data in
                        largeImageData = data
                        subgroup.leave()
                    })
                    subgroup.wait()
                    print("End (\(i))")
                    CoreDataService().saveImage(smallImageData: smallImageData, largeImageData: largeImageData)
                    group.leave()
                }
            }
            group.leave()
        })
        group.wait()
        completion()
    }
    
    private func getResponse(completion: @escaping ([ImageData]) -> Void) {
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let url = URL(string: downloadLink)!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData)
        let task = session.dataTask(with: request) { data, response, error in
            do {
                let responseObj = try JSONDecoder().decode(Response.self, from: data!)
                print("Pespond gotten")
                completion(responseObj.hits)
            } catch {
                print(error)
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
