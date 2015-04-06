//
//  Actualiza_Estatus.m
//  JaYinetApp
//
//  Created by Elizabeth Martínez Gómez on 04/04/15.
//  Copyright (c) 2015 Elizabeth Martínez Gómez. All rights reserved.
//

#import "Actualiza_Estatus.h"
#import <Parse/Parse.h>
NSString  *identificadorPaciente;
UIAlertView *alert;

@interface Actualiza_Estatus ()

@end

@implementation Actualiza_Estatus

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title=@"Situación Actual";
    
    identificadorPaciente =_nopaciente;
    self.txtNoaciente.text = _nopaciente;
    
    PFQuery *query = [PFQuery queryWithClassName:@"historial"];
    [query whereKey:@"id_pac" equalTo:self.txtNoaciente.text];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
                for (PFObject *object in objects) {
                    self.txtCama.text= object[@"num_cama"];
                    self.txtArea.text= object[@"id_area"];
                    PFQuery *query = [PFQuery queryWithClassName:@"pacientes"];
                    [query whereKey:@"objectId" equalTo:self.txtNoaciente.text];
                    [query findObjectsInBackgroundWithBlock:^(NSArray *objectsPac, NSError *error) {
                        if (!error) {
                                for (PFObject *objectPaciente in objectsPac) {
                                    NSString *nombrePac = [NSString stringWithFormat:@"%@ %@ %@",objectPaciente[@"nom_paciente"], objectPaciente[@"ap_paterno"] , objectPaciente[@"ap_materno"]];
                                        self.txtNombre.text= nombrePac;
                            }
                        } else {
                            // Log details of the failure
                            NSLog(@"Error: %@ %@", error, [error userInfo]);
                        }
                    }];
            }
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
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




- (IBAction)btnGuardar:(UIButton *)sender {
    
    PFObject *estadoObject = [PFObject objectWithClassName:@"historial"];
    estadoObject[@"desc_estado"] = self.txtEstatus.text;
    estadoObject[@"id_area"] = self.txtArea.text;
    estadoObject[@"id_pac"] = self.txtNoaciente.text;
    estadoObject[@"num_cama"] = self.txtCama.text;
    
    [estadoObject saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
        
            NSLog(@"Se actualizó el estado del paciente correctamente. %@", estadoObject.objectId);
            
            alert = [[UIAlertView alloc] initWithTitle:@"JaYinet"
                                               message:@"Se actualizó el estado del paciente correctamente."
                                              delegate:self
                                     cancelButtonTitle:@"Aceptar"
                                     otherButtonTitles: nil];
            [alert show];
            
            
            PFQuery *pushQuery = [PFInstallation query];
            [pushQuery whereKey:@"deviceType" equalTo:@"ios"];
            
            // Send push notification to query
            [PFPush sendPushMessageToQueryInBackground:pushQuery
                                           withMessage:self.txtEstatus.text];

            
            
         /*   PFQuery *pushQuery = [PFInstallation query];
            [pushQuery whereKey:@"injuryReports" equalTo:YES];
            
            // Send push notification to query
            PFPush *push = [[PFPush alloc] init];
            [push setQuery:pushQuery]; // Set our Installation query
            [push setMessage:@"Willie Hayes injured by own pop fly."];
            [push sendPushInBackground];
            */
            
                        /*
            PFQuery *queryU = [PFQuery queryWithClassName:@"responsables_token"];
            [queryU whereKey:@"id_paciente" equalTo:self.txtNoaciente.text ];
            [queryU findObjectsInBackgroundWithBlock:^(NSArray *objectsU, NSError *error) {
                if (!error) {
                    // The find succeeded.
                    for (PFObject *objectU in objectsU) {
                        // NSLog(@"IDPacienteVARRRR:  %@", idpaciente);
                        
                        NSString *iduser=objectU.objectId;
                        NSString *token= objectU[@"device_token"];
                        
                        NSLog(@"TOKENNNNN:  %@", token);
                        
                         PFQuery *pushQuery = [PFInstallation query];
                         [pushQuery whereKey:@"deviceToken" equalTo:token];
                         
                         // Send push notification to query
                         [PFPush sendPushMessageToQueryInBackground:pushQuery
                         withMessage:self.txtEstatus.text];
                         
                        
                        
                        
                    }
                } else {
                    // Log details of the failure
                    NSLog(@"Error: %@ %@", error, [error userInfo]);
                }
            }];*/
            
            
            
            
            
            
            
            /*
             PFQuery *queryI = [PFInstallation query];
             [queryI whereKey:@"id_paciente" equalTo:self.txtNoaciente.text];
             NSArray *usuariosI = [queryI findObjects];
             NSLog(@"USERRRRR IDDD :  %@", usuariosI);
            
            */
            
            
            
            
            
          
            // NSString *identificador;//= us[0,0];
            
            
          //  NSString *identificador = usuarios[0][@"objectId"];
          //  NSLog(@"identificador IDDD :  %@",identificador);
            

            
            
            /*
           
            
            
           
            PFQuery *query = [PFUser query];
            [query whereKey:@"id_paciente" equalTo:self.txtNoaciente.text];
            NSArray *usuarios = [query findObjects];
            NSLog(@"USERRRRR IDDD :  %@", usuarios);
           // NSString *identificador;//= us[0,0];
            
            
            NSString *identificador = usuarios[0][@"objectId"];
            NSLog(@"identificador IDDD :  %@",identificador);
            */
            
            
         /*   NSArray *channels = [NSArray arrayWithObjects:self.txtNoaciente.text, nil];
            PFPush *push = [[PFPush alloc] init];
            
            // Be sure to use the plural 'setChannels'.
            [push setChannels:channels];
            [push setMessage:@"The Giants won against the Mets 2-3."];
            [push sendPushInBackground];
            */
            
            PFQuery *queryins = [PFQuery queryWithClassName:@"Installation"];
            [queryins whereKey:@"id_paciente" equalTo: self.txtNoaciente.text];
            [queryins findObjectsInBackgroundWithBlock:^(NSArray *objectsins, NSError *errorins) {
                if (!errorins) {
                    // The find succeeded.
                    //NSLog(@"Successfully retrieved %d scores.", objects.count);
                    for (PFObject *objectins in objectsins) {
                        
                        NSLog(@"idtoken:  %@", objectins.objectId);
                        NSString *idtoken= objectins.objectId;
                        
                        PFQuery *pushQuery = [PFInstallation query];
                        [pushQuery whereKey:@"deviceToken" equalTo: idtoken];
                        
                        // Send push notification to query
                        [PFPush sendPushMessageToQueryInBackground:pushQuery
                                                       withMessage:self.txtEstatus.text];
                        
                        
                        
                        
                        
                        
                        
                        
                        /*   PFQuery *pushQuery = [PFInstallation query];
                         [pushQuery whereKey:@"deviceType" equalTo:@"ios"];
                         
                         // Send push notification to query
                         [PFPush sendPushMessageToQueryInBackground:pushQuery
                         withMessage:self.txtEstatus.text];
                         
                         */
                        
                        
                        
                    }
                } else {
                    // Log details of the failure
                    NSLog(@"Error: %@ %@", errorins, [errorins userInfo]);
                }
            }];

            
            
            
           
            
            /*
            
            PFQuery *queryU = [PFQuery queryWithClassName:@"User"];
            [queryU whereKey:@"id_paciente" equalTo:self.txtNoaciente.text];
            [queryU findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
                if (!error) {
                    // The find succeeded.
                    //NSLog(@"Successfully retrieved %d scores.", objects.count);
                    for (PFObject *object in objects) {
                      //  NSLog(@"USERRRRR:  %@", object.objectId);
                        // NSLog(@"IDPacienteVARRRR:  %@", idpaciente);
                        
                        NSString *iduser=object.objectId;
                        NSLog(@"USERRRRR:  %@", iduser);
                        
                        
                        
                    }
                } else {
                    // Log details of the failure
                    NSLog(@"Error: %@ %@", error, [error userInfo]);
                }
            }];*/
            
            
        } else {
            // There was a problem, check error.description
        }
    }];

    
    
    
    
    
}
- (IBAction)btnMenu:(UIBarButtonItem *)sender {
      [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}

@end
