//
//  ConsultarController.m
//  JaYinetApp
//
//  Created by Elizabeth Martínez Gómez on 01/04/15.
//  Copyright (c) 2015 Elizabeth Martínez Gómez. All rights reserved.
//

#import "ConsultarController.h"
#import "SWRevealViewController.h"
#import "HistorialPacienteController.h"

NSString *idpaciente;
UIAlertView *alert;

@interface ConsultarController ()

@end

@implementation ConsultarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title=@"Buscar Paciente";
    
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

- (IBAction)btnBuscar:(id)sender {
 /*   [PFUser logInWithUsernameInBackground:self.txtNoBuscar.text password:self.txtNoBuscar.text
                                    block:^(PFUser *user, NSError *error) {
                                        if (user) {
                                            PFInstallation *installation = [PFInstallation currentInstallation];
                                            installation[@"user"] = [PFUser currentUser];
                                            [installation saveInBackground];
                                        }
                                        else {
                                            alert = [[UIAlertView alloc] initWithTitle:@"Alerta Oaxaca"
                                                                               message:@"Error de inicio de sesion"
                                                                              delegate:self
                                                                     cancelButtonTitle:@"Cancelar"
                                                                     otherButtonTitles: nil];
                                            [alert show];
                                        }
                                    }];*/
    
    PFQuery *query = [PFQuery queryWithClassName:@"pacientes"];
    [query whereKey:@"objectId" equalTo:self.txtNoBuscar.text];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.
            for (PFObject *object in objects) {
                idpaciente=object.objectId;
                self.txtNoPaciente.text= object.objectId;
                self.txtNombre.text= object[@"nom_paciente"];
                self.txtPaterno.text= object[@"ap_paterno"];
                self.txtMaterno.text= object[@"ap_materno"];
                
                PFQuery *queryE = [PFQuery queryWithClassName:@"historial"];
                [queryE whereKey:@"id_pac" equalTo:idpaciente];
                [queryE findObjectsInBackgroundWithBlock:^(NSArray *objectsHist, NSError *errorh) {
                    if (!errorh) {
                        // The find succeeded.
                        NSLog(@"Successfully retrieved %d scores.", objectsHist.count);
                        // Do something with the found objects
                        for (PFObject *objectH in objectsHist) {
                            NSLog(@"OBjHistorial....%@", objectH.objectId);
                            NSLog(@"Estado-..---%@", objectH);
                            self.txtEstado.text= objectH[@"desc_estado"];
                        }
                    } else {
                        // Log details of the failure
                        NSLog(@"Error: %@ %@", errorh, [errorh userInfo]);
                    }
                }];
                
                
                PFUser *user = [PFUser user];
                user.username = self.txtNoPaciente.text;
                user.password = self.txtNoPaciente.text;
                user[@"id_paciente"] = self.txtNoPaciente.text;
                
                [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                    if (!error) {
                        
                        
                        // Hooray! Let them use the app now.
                        PFInstallation *installation = [PFInstallation currentInstallation];
                        installation[@"user"] = [PFUser currentUser];
                        [installation saveInBackground];
                        
                        
                    } else {
                        NSString *errorString = [error userInfo][@"error"];
                        // Show the errorString somewhere and let the user try again.
                    }
                }];
            }
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
    
    
    
}


-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([[segue identifier] isEqualToString:@"SegueHistorialN"]) {
        UINavigationController *navController = [segue destinationViewController];
        HistorialPacienteController *ViewHistorial = (HistorialPacienteController *)([navController viewControllers][0]);
        ViewHistorial.idpaciente = self.txtNoPaciente.text;
    }
    
    
}


@end
