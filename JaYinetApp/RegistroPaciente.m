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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

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
        
        } else {
            // There was a problem, check error.description
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









@end
