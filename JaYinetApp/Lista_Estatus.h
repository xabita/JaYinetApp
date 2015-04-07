//
//  Lista_Estatus.h
//  JaYinetApp
//
//  Created by Elizabeth Martínez Gómez on 06/04/15.
//  Copyright (c) 2015 Elizabeth Martínez Gómez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Lista_Estatus : UIViewController

@property (strong, nonatomic) NSString *nopaciente;

@property (strong, nonatomic) IBOutlet UITextField *txtNoPaciente;
@property (strong, nonatomic) IBOutlet UITextField *txtNombre;
@property (strong, nonatomic) IBOutlet UITextField *txtCama;
@property (strong, nonatomic) IBOutlet UITextField *txtArea;
@property (strong, nonatomic) IBOutlet UITextView *txtEstatus;
@property (strong, nonatomic) IBOutlet UIButton *btnGuardar;
- (IBAction)btnGuardar:(UIButton *)sender;
- (IBAction)btnMenu:(UIButton *)sender;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *btnMenu1;
- (IBAction)btnMenu1:(UIBarButtonItem *)sender;

@end
