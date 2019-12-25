//
//  CatalogBuilder.swift
//  Builder
//
//  Created by Максим Вильданов on 06/06/2019.
//  Copyright © 2019 Максим Вильданов. All rights reserved.
//

import UIKit


class  CatalogBuilder: ModuleBuilder {
    
    var title: String?
    
    func setTitle(_ title: String) -> CatalogBuilder {
        self.title = title
        return self
    }
    
    
    func build() -> UIViewController {
        guard let title = title else {fatalError("You might set title")}
        let presenter = CatalogPresenter()
        let interactor = CatalogInteractor(presenter: presenter)
        let controller = CatalogViewController(title: title, interactor: interactor)
        presenter.viewController = controller
        
        return controller
    }
    
    
    
    
}
