//
//  NetworkService.swift
//  Puzzles
//
//  Created by Leonid Serebryanyy on 18.11.2019.
//  Copyright © 2019 Leonid Serebryanyy. All rights reserved.
//

import Foundation
import UIKit


class NetworkService {
    
    let session: URLSession
    
    private var queue = DispatchQueue(label: "com.sber.puzzless", qos: .default, attributes: .concurrent)
    
    
    init() {
        session = URLSession(configuration: .default)
    }
    
    
    // MARK:- Первое задание
    
    ///  Вот здесь должны загружаться 4 картинки и совмещаться в одну.
    ///  Для выполнения этой задачи вам можно изменять только этот метод.
    ///  Метод, соединяющий картинки в одну, уже написан (вызывается в конце).
    ///  Ответ передайте в completion.
    ///  Помните, что надо сделать так, чтобы метод работал как можно быстрее.
    public func loadPuzzle(completion: @escaping (Result<UIImage, Error>) -> ()) {
        // это адреса картинок. они работающие, всё ок!
        let firstURL = URL(string: "https://i.imgur.com/JnY1dY7.jpg")!
        let secondURL = URL(string: "https://i.imgur.com/S93pvex.jpg")!
        let thirdURL = URL(string: "https://i.imgur.com/pvCHGsL.jpg")!
        let fourthURL = URL(string: "https://i.imgur.com/DgijrVE.jpg")!
        
        
        let urls = [firstURL, secondURL, thirdURL, fourthURL]
        
        // в этот массив запишите итоговые картинки
        var images = [UIImage?](repeating: nil, count: urls.count)
        var results = [UIImage]()
        
        queue.async {
            let downloadingGroup = DispatchGroup()
            for (i, url) in urls.enumerated() {
                downloadingGroup.enter()
                self.loadImage(by: url, with: { image in
                    images[i] = image
                    downloadingGroup.leave()
                })
            }
            
            downloadingGroup.notify(queue: DispatchQueue.main) {
                results = images.map({ $0! })
                if let merged = ImagesServices.image(byCombining: results) {
                    completion(.success(merged))
                }
            }
        }
        
        
    }
    
    private func loadImage(by url: URL, with completion: @escaping (UIImage) -> Void) {
        let session = URLSession.shared
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData)
        let task = session.dataTask(with: request) { (data, response, error) in
            guard let image = UIImage(data: data!) else {
                print("Couldn't convert gotten data to UIImage")
                return
            }
            completion(image)
        }
        task.resume()
    }
    
    
    // MARK:- Второе задание
    
    
    ///  Здесь задание такое:
    ///  У вас есть ключ keyURL, по которому спрятан клад.
    ///  Верните картинку с этим кладом в completion
    public func loadQuiz(completion: @escaping(Result<UIImage, Error>) -> ()) {
        let keyURL = URL(string: "https://sberschool-c264c.firebaseio.com/enigma.json?avvrdd_token=AIzaSyDqbtGbRFETl2NjHgdxeOGj6UyS3bDiO-Y")!
        
        loadImageLink(by: keyURL, completion: { imageLink in
            let url = URL(string: imageLink)
            self.loadImage(by: url!, with: { image in
                completion(.success(image))
            })
        })
        
        // Вам придёт строка, её надо прочитать с помощью JSONDecoder (ну как мы всегда читали с файрбэйза)
    }
    
    private func loadImageLink(by url: URL, completion: @escaping (String) -> Void) {
        let session = URLSession.shared
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData)
        let task = session.dataTask(with: request) { (data, response, error) in
            do {
                let imageLink = try JSONDecoder().decode(String.self, from: data!)
                completion(imageLink)
            } catch {
                print("Couldn't convert gotten data to String")
            }
        }
        task.resume()
    }
}
