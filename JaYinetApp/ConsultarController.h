//
//  ConsultarController.h
//  JaYinetApp
//
//  Created by Elizabeth Martínez Gómez on 01/04/15.
//  Copyright (c) 2015 Elizabeth Martínez Gómez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface ConsultarController : UIViewController
@property (strong, nonatomic) IBOutlet UIBarButtonItem *btnMenu;
@property (strong, nonatomic) IBOutlet UITextField *txtNoBuscar;

@property (strong, nonatomic) IBOutlet UITextField *txtNoPaciente;
@property (strong, nonatomic) IBOutlet UITextField *txtNombre;

@property (strong, nonatomic) IBOutlet UITextField *txtPaterno;
@property (strong, nonatomic) IBOutlet UITextField *txtMaterno;
@property (strong, nonatomic) IBOutlet UITextView *txtEstado;

@property (strong, nonatomic) IBOutlet UIButton *btnBuscar;

@property (strong, nonatomic) IBOutlet UIButton *btnHistorial;

- (IBAction)btnBuscar:(id)sender;

@end
