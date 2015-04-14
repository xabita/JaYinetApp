//
//  BuscarPaciente.m
//  JaYinetApp
//
//  Created by Elizabeth Martínez Gómez on 04/04/15.
//  Copyright (c) 2015 Elizabeth Martínez Gómez. All rights reserved.
//

#import "BuscarPaciente.h"
#import <Parse/Parse.h>
#import "SWRevealViewController.h"
#import "HistorialEstatus.h"
#import "Actualiza_Estatus.h"
UIAlertView *alert;
NSString *idpaciente;

@interface BuscarPaciente ()

@end

@implementation BuscarPaciente

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
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

- (IBAction)Buscar:(UIButton *)sender {
    PFQuery *query = [PFQuery queryWithClassName:@"pacientes"];
    [query whereKey:@"objectId" equalTo:self.txtBuscar.text];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.
            for (PFObject *object in objects) {
                idpaciente=object.objectId;
                NSLog(@"IDPaciente:  %@", object.objectId);
                // NSLog(@"IDPacienteVARRRR:  %@", idpaciente);
                self.txtNoPaciente.text= object.objectId;
                self.txtNombre.text= object[@"nom_paciente"];
                self.txtPaterno.text= object[@"ap_paterno"];
                self.txtMaterno.text= object[@"ap_materno"];
                self.txtDomicilio.text=object[@"domicilio"];
                
                PFQuery *queryE = [PFQuery queryWithClassName:@"historial"];
                [queryE whereKey:@"id_pac" equalTo:idpaciente];
                [queryE findObjectsInBackgroundWithBlock:^(NSArray *objectsHist, NSError *errorh) {
                    if (!errorh) {
                        // The find succeeded.
                        // NSLog(@"Successfully retrieved %d scores.", objectsHist.count);
                        // Do something with the found objects
                        for (PFObject *objectH in objectsHist) {
                            NSLog(@"Estado-..---%@", objectH);
                            self.txtEstado.text= objectH[@"desc_estado"];
                        }
                    } else {
                        // Log details of the failure
                        NSLog(@"Error: %@ %@", errorh, [errorh userInfo]);
                    }
                }];
            }
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
            alert = [[UIAlertView alloc] initWithTitle:@"JaYinet"
                                               message:@"El folio que ingresò no es válido"
                                              delegate:self
                                     cancelButtonTitle:@"Aceptar"
                                     otherButtonTitles: nil];
            [alert show];
        }
    }];
}


-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    /*  NSLog(@"segueRespaciente retrieved %@", @"SagaEstatus");
     if ([[segue identifier] isEqualToString:@"SagaEstatus"]) {
     Actualiza_Estatus *segundoView = [segue destinationViewController];
     segundoView.nopaciente = self.txtNoPaciente.text;
     }*/
    
    if ([[segue identifier] isEqualToString:@"SagaHistorialEstatus"]) {
        UINavigationController *navController = [segue destinationViewController];
        HistorialEstatus *ViewHistorial = (HistorialEstatus *)([navController viewControllers][0]);
        ViewHistorial.idpaciente = self.txtNoPaciente.text;
    }
    
    if ([[segue identifier] isEqualToString:@"SagaEstatus"]) {
        UINavigationController *navController = [segue destinationViewController];
        Actualiza_Estatus *ViewHistorial = (Actualiza_Estatus *)([navController viewControllers][0]);
        ViewHistorial.nopaciente = self.txtNoPaciente.text;
    }
    
    
    
    
}



- (IBAction)btnMenu:(UIBarButtonItem *)sender {
   [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}



@end
