//
//  Lista_Estatus.m
//  JaYinetApp
//
//  Created by Elizabeth Martínez Gómez on 06/04/15.
//  Copyright (c) 2015 Elizabeth Martínez Gómez. All rights reserved.
//

#import "Lista_Estatus.h"
#import <Parse/Parse.h>
NSString  *identificadorPaciente;
UIAlertView *alert;



@interface Lista_Estatus ()

@end

@implementation Lista_Estatus

@synthesize txtNoPaciente;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title=@"Situación Actual";
    
    identificadorPaciente =_nopaciente;
    
   // NSLog(@"DETALLEEEE. %@", identificadorPaciente);
    
    self.txtNoPaciente.text = _nopaciente;
    
    PFQuery *query = [PFQuery queryWithClassName:@"historial"];
    [query whereKey:@"id_pac" equalTo:self.txtNoPaciente.text];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            for (PFObject *object in objects) {
                self.txtCama.text= object[@"num_cama"];
                self.txtArea.text= object[@"id_area"];
                PFQuery *query = [PFQuery queryWithClassName:@"pacientes"];
                [query whereKey:@"objectId" equalTo:self.txtNoPaciente.text];
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
    estadoObject[@"id_pac"] = self.txtNoPaciente.text;
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
            
            
            PFQuery *queryins = [PFQuery queryWithClassName:@"Installation"];
            [queryins whereKey:@"id_paciente" equalTo: self.txtNoPaciente.text];
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
        } else {
            // There was a problem, check error.description
        }
    }];

    
}

- (IBAction)btnMenu:(UIButton *)sender {
   
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}


- (IBAction)btnMenu1:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
@end
