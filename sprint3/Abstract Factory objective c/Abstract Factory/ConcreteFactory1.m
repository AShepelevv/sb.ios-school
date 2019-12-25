//
//  ConcreteFactory1.m
//  Abstract Factory
//
//  Created by Максим Вильданов on 26.11.2019.
//  Copyright © 2019 Максим Вильданов. All rights reserved.
//

#import "ConcreteFactory1.h"


@implementation ConcreteFactory1

-(id<AbstractProductA>) createProductA {
    ConcreteProductA1 *productA1 = [ConcreteProductA1 new];
    return productA1;
}
-(id<AbstractProductB>) createProductB {
    ConcreteProductB1 *productB1 = [ConcreteProductB1 new];
    return productB1;
}

@end
