//
//  HistorialPacienteController.h
//  JaYinetApp
//
//  Created by Elizabeth Martínez Gómez on 02/04/15.
//  Copyright (c) 2015 Elizabeth Martínez Gómez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import <ParseUI/PFQueryTableViewController.h>


@interface HistorialPacienteController : PFQueryTableViewController

@property (strong, nonatomic) NSString *idpaciente;
@property (strong, nonatomic) IBOutlet UIButton *btnRegresar;


@end
