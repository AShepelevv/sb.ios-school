//
//  Client.h
//  Abstract Factory
//
//  Created by Максим Вильданов on 26.11.2019.
//  Copyright © 2019 Максим Вильданов. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AbstractFactory.h"
#import "AbstractProductA.h"
#import "AbstractProductB.h"

NS_ASSUME_NONNULL_BEGIN

@interface Client : NSObject

+(void) clientMethod:(id<AbstractFactory> )factory;

@end

NS_ASSUME_NONNULL_END
