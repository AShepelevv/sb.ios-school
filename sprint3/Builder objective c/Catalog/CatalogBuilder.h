//
//  CatalogBuilder.h
//  Builder objc
//
//  Created by Максим Вильданов on 26.11.2019.
//  Copyright © 2019 Максим Вильданов. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ModuleBuilder.h"
#import "CatalogPresenter.h"
#import "CatalogIteractor.h"
#import "CatalogPresenter.h"
#import "CatalogViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface CatalogBuilder : NSObject <ModuleBuilder>

@property (weak, nonatomic) NSString *title;

-(instancetype)initWithTitle:(NSString *)title;

@end

NS_ASSUME_NONNULL_END
