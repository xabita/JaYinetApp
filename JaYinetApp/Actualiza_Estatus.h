//
//  Actualiza_Estatus.h
//  JaYinetApp
//
//  Created by Elizabeth Martínez Gómez on 04/04/15.
//  Copyright (c) 2015 Elizabeth Martínez Gómez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Actualiza_Estatus : UIViewController <UIAlertViewDelegate>

@property (strong, nonatomic) NSString *nopaciente;

@property (strong, nonatomic) IBOutlet UITextField *txtNoaciente;
@property (strong, nonatomic) IBOutlet UITextField *txtNombre;
@property (strong, nonatomic) IBOutlet UITextField *txtCama;
@property (strong, nonatomic) IBOutlet UITextField *txtArea;
@property (strong, nonatomic) IBOutlet UITextView *txtEstatus;
@property (strong, nonatomic) IBOutlet UIButton *btnGuardar;
- (IBAction)btnGuardar:(UIButton *)sender;

@property (strong, nonatomic) IBOutlet UIBarButtonItem *btnMenu;
- (IBAction)btnMenu:(UIBarButtonItem *)sender;

@end
