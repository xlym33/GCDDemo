//
//  ViewController.m
//  MacDemo
//
//  Created by huangshan on 2017/8/7.
//  Copyright © 2017年 huangshan. All rights reserved.
//

#import "ViewController.h"
#import "DispatchTest.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    
    DispatchTest *test = [[DispatchTest alloc] init];
    [test test1];
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


@end
