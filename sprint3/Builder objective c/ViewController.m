//
//  ViewController.m
//  Builder objc
//
//  Created by Максим Вильданов on 26.11.2019.
//  Copyright © 2019 Максим Вильданов. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property UIButton *button;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.redColor;
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(40, 50, 100, 40)];
    [button addTarget:self action:@selector(buttonPressed:)
    forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"press" forState:UIControlStateNormal];
    [self.view addSubview:button];
    
    
}

#pragma mark - Action to create Builder
- (void)buttonPressed:(UIButton *)button {
    CatalogBuilder *catalog = [[CatalogBuilder alloc] initWithTitle:@"Catalog"];
    UIViewController *catalogVC = [catalog build];
    [self presentViewController:catalogVC animated:YES completion:nil];
    
    
}


@end
