//
//  ViewController.m
//  JaYinetApp
//
//  Created by Elizabeth Martínez Gómez on 01/04/15.
//  Copyright (c) 2015 Elizabeth Martínez Gómez. All rights reserved.
//

#import "HomeController.h"
#import "SWRevealViewController.h"

@interface HomeController ()

@end

@implementation HomeController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.title=@"Inicio";
    
    
    // Do any additional setup after loading the view, typically from a nib.
    
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.btnMenu setTarget: self.revealViewController];
        [self.btnMenu setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
