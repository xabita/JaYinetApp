//
//  HistorialEstatus.h
//  JaYinetApp
//
//  Created by Elizabeth Martínez Gómez on 04/04/15.
//  Copyright (c) 2015 Elizabeth Martínez Gómez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import <ParseUI/PFQueryTableViewController.h>

@interface HistorialEstatus : PFQueryTableViewController


@property (strong, nonatomic) NSString *idpaciente;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *btnMenu;

- (IBAction)btnMenu:(UIBarButtonItem *)sender;

@end
