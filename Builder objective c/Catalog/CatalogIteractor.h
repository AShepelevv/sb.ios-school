//
//  CatalogIteractor.h
//  Builder objc
//
//  Created by Максим Вильданов on 26.11.2019.
//  Copyright © 2019 Максим Вильданов. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CatalogPresenter.h"
#import "Iteractor.h"
#import "Presenter.h"

NS_ASSUME_NONNULL_BEGIN


@interface CatalogIteractor : NSObject <Iteractor>

@property (strong, nonatomic) id<Presenter> presenter;

-(instancetype) initWith :(id <Presenter>)presenter;

@end

NS_ASSUME_NONNULL_END
