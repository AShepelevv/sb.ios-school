//
//  CatalogPresenter.h
//  Builder objc
//
//  Created by Максим Вильданов on 26.11.2019.
//  Copyright © 2019 Максим Вильданов. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CatalogViewController.h"
#import "Presenter.h"

NS_ASSUME_NONNULL_BEGIN

@interface CatalogPresenter : NSObject <Presenter>

@property (weak, nonatomic) CatalogViewController *catalogVC;

-(instancetype) initMessage :(NSString *)messageInfo;

@end

NS_ASSUME_NONNULL_END
