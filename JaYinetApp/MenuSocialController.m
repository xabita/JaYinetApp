//
//  MenuSocialController.m
//  JaYinetApp
//
//  Created by Elizabeth Martínez Gómez on 02/04/15.
//  Copyright (c) 2015 Elizabeth Martínez Gómez. All rights reserved.
//

#import "MenuSocialController.h"
#import "SWRevealViewController.h"
#import <Parse/Parse.h>

@interface MenuSocialController ()

@end

@implementation MenuSocialController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    PFUser *currentUser = [PFUser currentUser];
    if (currentUser) {
        // do stuff with the user
    } else {
        // show the signup or login screen
    }
    
    
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btnMenu:(UIBarButtonItem *)sender {
     [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)btnCerrarSesion:(UIButton *)sender {
    [PFUser logOut];
    PFUser *currentUser = [PFUser currentUser];
    
}


@end
