//
//  CatalogInteractor.swift
//  Builder
//
//  Created by Максим Вильданов on 06/06/2019.
//  Copyright © 2019 Максим Вильданов. All rights reserved.
//

import Foundation


protocol Interactor {
    init(presenter: Presenter)
}

class CatalogInteractor: Interactor {
    
    var presenter: Presenter!
    
//MARK: - Buisness logic
    
    required init(presenter: Presenter) {
        self.presenter = presenter
    }
    
}
