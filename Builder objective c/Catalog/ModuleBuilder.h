//
//  ModuleBuilder.h
//  Builder objc
//
//  Created by Максим Вильданов on 26.11.2019.
//  Copyright © 2019 Максим Вильданов. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ModuleBuilder <NSObject>

-(UIViewController *) build;

@end

NS_ASSUME_NONNULL_END
