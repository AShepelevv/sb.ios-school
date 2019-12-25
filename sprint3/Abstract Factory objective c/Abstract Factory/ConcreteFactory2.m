//
//  ConcreteFactory2.m
//  Abstract Factory
//
//  Created by Максим Вильданов on 26.11.2019.
//  Copyright © 2019 Максим Вильданов. All rights reserved.
//

#import "ConcreteFactory2.h"

@implementation ConcreteFactory2

-(id<AbstractProductA>) createProductA {
    ConcreteProductA2 *productA2 = [ConcreteProductA2 new];
    return productA2;
}
-(id<AbstractProductB>) createProductB {
    ConcreteProductB2 *productB2 = [ConcreteProductB2 new];
    return productB2;
}

@end
