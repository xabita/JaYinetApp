//
//  IniciarSesionController.h
//  JaYinetApp
//
//  Created by Elizabeth Martínez Gómez on 01/04/15.
//  Copyright (c) 2015 Elizabeth Martínez Gómez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface IniciarSesionController : UIViewController<UIAlertViewDelegate>
@property (strong, nonatomic) IBOutlet UIBarButtonItem *btnMenu;

@property (strong, nonatomic) IBOutlet UITextField *txtUsuario;
@property (strong, nonatomic) IBOutlet UITextField *txtContrasenia;
@property (strong, nonatomic) IBOutlet UIButton *btnIniciarSesion;
- (IBAction)btnIniciarSesion:(UIButton *)sender;

@end
