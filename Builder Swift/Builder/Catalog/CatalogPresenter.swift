//
//  CatalogPresenter.swift
//  Builder
//
//  Created by Максим Вильданов on 06/06/2019.
//  Copyright © 2019 Максим Вильданов. All rights reserved.
//

import Foundation

protocol Presenter {
    var messageInfo: String {get}
}


class CatalogPresenter: Presenter {
    
    weak var viewController: CatalogViewController?
    
    
    
    var messageInfo = "Create viewmodel for Present"
}
