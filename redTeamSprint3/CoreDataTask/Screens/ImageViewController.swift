//
//  ImageViewController.swift
//  redTeamSprint3
//
//  Created by Aleksey Shepelev on 24/11/2019.
//  Copyright © 2019 redTeam. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {
    
    let imageView = UIImageView()
    
    init(imageData : Data) {
        super.init(nibName: nil, bundle: nil)
        imageView.image = UIImage(data: imageData)!
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        imageView.frame = view.safeAreaLayoutGuide.layoutFrame
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
        
    }
}
