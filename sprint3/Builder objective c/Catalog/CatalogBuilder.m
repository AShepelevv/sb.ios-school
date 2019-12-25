//
//  CatalogBuilder.m
//  Builder objc
//
//  Created by Максим Вильданов on 26.11.2019.
//  Copyright © 2019 Максим Вильданов. All rights reserved.
//

#import "CatalogBuilder.h"


@implementation CatalogBuilder

- (instancetype)initWithTitle:(NSString *)title {
    self.title = title;
    return self;
}

-(UIViewController *) build {
    if (self.title != nil) {
        CatalogPresenter *presenter = [[CatalogPresenter alloc] initMessage:@"Presenter Message"];
        CatalogIteractor *interactor = [[CatalogIteractor alloc] initWith: presenter];
        CatalogViewController *controller = [[CatalogViewController alloc] init: self.title :interactor];
        presenter.catalogVC = controller;
        return controller;
    }
    return [CatalogViewController new];
}

@end
