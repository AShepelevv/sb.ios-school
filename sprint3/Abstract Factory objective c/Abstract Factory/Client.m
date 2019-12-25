//
//  Client.m
//  Abstract Factory
//
//  Created by Максим Вильданов on 26.11.2019.
//  Copyright © 2019 Максим Вильданов. All rights reserved.
//

#import "Client.h"

@implementation Client

+(void) clientMethod:(id<AbstractFactory> )factory {
    id<AbstractProductA> productA = [factory createProductA];
    id<AbstractProductB> productB = [factory createProductB];
    
    NSLog(@"%@", [productA usefulFunctionA]);
    NSLog(@"%@", [productB usefulFunctionB]);
}

@end
