//
//  CatalogViewController.h
//  Builder objc
//
//  Created by Максим Вильданов on 26.11.2019.
//  Copyright © 2019 Максим Вильданов. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Iteractor.h"

NS_ASSUME_NONNULL_BEGIN

@interface CatalogViewController : UIViewController

@property (strong, nonatomic )id<Iteractor>iteractor;

-(instancetype)init :(NSString *)withTitle :(id<Iteractor>)andIteractor;

@end

NS_ASSUME_NONNULL_END
