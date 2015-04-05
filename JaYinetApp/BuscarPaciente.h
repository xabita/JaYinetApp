//
//  BuscarPaciente.h
//  JaYinetApp
//
//  Created by Elizabeth Martínez Gómez on 04/04/15.
//  Copyright (c) 2015 Elizabeth Martínez Gómez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BuscarPaciente : UIViewController<UIAlertViewDelegate>

@property (strong, nonatomic) IBOutlet UIBarButtonItem *btnMenu;
@property (strong, nonatomic) IBOutlet UITextField *txtBuscar;

@property (strong, nonatomic) IBOutlet UITextField *txtNoPaciente;
@property (strong, nonatomic) IBOutlet UITextField *txtNombre;
@property (strong, nonatomic) IBOutlet UITextField *txtPaterno;

@property (strong, nonatomic) IBOutlet UITextField *txtMaterno;
@property (strong, nonatomic) IBOutlet UITextView *txtEstado;
@property (strong, nonatomic) IBOutlet UIButton *btnBuscar;
- (IBAction)Buscar:(UIButton *)sender;
- (IBAction)btnMenu:(UIBarButtonItem *)sender;

@property (strong, nonatomic) IBOutlet UIButton *btnHistorial;
//@property (strong, nonatomic) IBOutlet UIBarButtonItem *btnEstado;
@property (strong, nonatomic) IBOutlet UIButton *btnEstado;

@end
