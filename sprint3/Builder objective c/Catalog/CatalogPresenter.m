//
//  CatalogPresenter.m
//  Builder objc
//
//  Created by Максим Вильданов on 26.11.2019.
//  Copyright © 2019 Максим Вильданов. All rights reserved.
//

#import "CatalogPresenter.h"

@implementation CatalogPresenter
@synthesize messageInfo;

-(instancetype) initMessage :(NSString *)messageInfo {
    self.messageInfo = messageInfo;
    
    return self;
}
@end


