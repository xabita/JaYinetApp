//
//  RegistroPaciente.m
//  JaYinetApp
//
//  Created by Elizabeth Martínez Gómez on 03/04/15.
//  Copyright (c) 2015 Elizabeth Martínez Gómez. All rights reserved.
//

#import "RegistroPaciente.h"
#import <Parse/Parse.h>
NSString *idpac;
UIAlertView *alert;

@interface RegistroPaciente ()

@end

@implementation RegistroPaciente

- (void)viewDidLoad {
    [super viewDidLoad];
     self.title=@"Registrar Paciente";
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)btnGuardar:(UIButton *)sender {
    PFObject *pacienteObject = [PFObject objectWithClassName:@"pacientes"];
    pacienteObject[@"nom_paciente"] = self.txtNombre.text;
    pacienteObject[@"ap_paterno"] = self.txtPaterno.text;
    pacienteObject[@"ap_materno"] = self.txtMaterno.text;
    pacienteObject[@"domicilio"] = self.txtDomicilio.text;
    [pacienteObject saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            // The object has been saved.
            idpac=pacienteObject.objectId;
            NSLog(@"Guardando idddd %@", idpac);
            NSString *mensaje = [NSString stringWithFormat:@"%@ %@", @"El folio del paciente registrado es: ", idpac];

          
            /*  PFObject *estadoObject = [PFObject objectWithClassName:@"historial"];
             estadoObject[@"desc_estado"] = self.txtEstado.text;
             // Add a relation between the Post and Comment
             // estadoObject[@"idpaciente"] = pacienteObject;
             estadoObject[@"id_pac"] =  idpac;*/
            
            PFObject *estadoObject = [PFObject objectWithClassName:@"historial"];
            estadoObject[@"desc_estado"] = self.txtEstado.text;
            estadoObject[@"id_pac"] = idpac;
            estadoObject[@"num_cama"] = self.txtCama.text;
            estadoObject[@"id_area"] = self.txtArea.text;
            
            [estadoObject saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                if (succeeded) {
                    NSLog(@"historial guardado %@", estadoObject.objectId);
                } else {
                    // There was a problem, check error.description
                }
            }];
            
            PFObject *responsableObject = [PFObject objectWithClassName:@"responsables"];
            responsableObject[@"nom_responsable"] = self.txtResponsable.text;
            responsableObject[@"no_movil"] = self.txtTelefono.text;
            responsableObject[@"id_pac"] = idpac;
            [responsableObject saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                if (succeeded) {
                    NSLog(@"responsables guardado %@", responsableObject.objectId);
                } else {
                    // There was a problem, check error.description
                }
            }];
            
            
            
            alert = [[UIAlertView alloc] initWithTitle:@"JaYinet"
                                               message:mensaje
                                              delegate:self
                                     cancelButtonTitle:@"Aceptar"
                                     otherButtonTitles: nil];
            [alert show];
            
            
        
        } else {
            NSString *mensaje = [NSString stringWithFormat:@"%@", @"Ocurrio un Error al realizar el registro intentelo de nuevo. "];
            alert = [[UIAlertView alloc] initWithTitle:@"JaYinet"
                                               message:mensaje
                                              delegate:self
                                     cancelButtonTitle:@"Aceptar"
                                     otherButtonTitles: nil];
            [alert show];
            

            
        }
    }];
    
    self.txtNombre.text=NULL;
    self.txtPaterno.text=NULL;
    self.txtMaterno.text=NULL;
    self.txtDomicilio.text=NULL;
    self.txtEstado.text=NULL;
    self.txtCama.text=NULL;
    self.txtArea.text=NULL;
    self.txtResponsable.text=NULL;
    self.txtTelefono.text=NULL;
    
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}


- (IBAction)btnMenu:(UIBarButtonItem *)sender {
      [self dismissViewControllerAnimated:YES completion:nil];
}
@end
