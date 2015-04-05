//
//  RegistroPaciente.h
//  JaYinetApp
//
//  Created by Elizabeth Martínez Gómez on 03/04/15.
//  Copyright (c) 2015 Elizabeth Martínez Gómez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegistroPaciente : UIViewController<UIAlertViewDelegate>
@property (strong, nonatomic) IBOutlet UITextField *txtNombre;
@property (strong, nonatomic) IBOutlet UITextField *txtPaterno;
@property (strong, nonatomic) IBOutlet UITextField *txtMaterno;
@property (strong, nonatomic) IBOutlet UITextField *txtDomicilio;
@property (strong, nonatomic) IBOutlet UITextView *txtEstado;
@property (strong, nonatomic) IBOutlet UITextField *txtCama;
@property (strong, nonatomic) IBOutlet UITextField *txtArea;
@property (strong, nonatomic) IBOutlet UITextField *txtResponsable;
@property (strong, nonatomic) IBOutlet UITextField *txtTelefono;
@property (strong, nonatomic) IBOutlet UIButton *btnGuardar;
- (IBAction)btnGuardar:(UIButton *)sender;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *btnMenu;
- (IBAction)btnMenu:(UIBarButtonItem *)sender;

@end
