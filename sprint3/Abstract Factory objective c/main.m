//
//  main.m
//  Abstract Factory
//
//  Created by Максим Вильданов on 26.11.2019.
//  Copyright © 2019 Максим Вильданов. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "Client.h"
#import "ConcreteFactory1.h"
#import "ConcreteFactory2.h"

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
        
        #pragma mark - Abstract Factory
        ConcreteFactory1 *factory1 = [ConcreteFactory1 new];
        ConcreteFactory2 *factory2 = [ConcreteFactory2 new];
        
        [Client clientMethod:factory1];
        [Client clientMethod:factory2];
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
