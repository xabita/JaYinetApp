//
//  IniciarSesionController.m
//  JaYinetApp
//
//  Created by Elizabeth Martínez Gómez on 01/04/15.
//  Copyright (c) 2015 Elizabeth Martínez Gómez. All rights reserved.
//

#import "IniciarSesionController.h"
#import "SWRevealViewController.h"
#import <Parse/Parse.h>

UIAlertView     *alert;


@interface IniciarSesionController ()

@end

@implementation IniciarSesionController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title=@"Login";
    
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

- (IBAction)btnIniciarSesion:(UIButton *)sender {
    [PFUser logInWithUsernameInBackground:self.txtUsuario.text password:self.txtContrasenia.text
                                    block:^(PFUser *user, NSError *error) {
                                        if (user) {
                                            NSLog(@"logueadooooo");
                                            // Associate the device with a user
                                            PFInstallation *installation = [PFInstallation currentInstallation];
                                            installation[@"user"] = [PFUser currentUser];
                                            [installation saveInBackground];
                                            [self performSegueWithIdentifier:@"SessionSegue" sender:self];
                                            
                                            
                                        } else {
                                            
                                            alert = [[UIAlertView alloc] initWithTitle:@"JaYinet"
                                                                               message:@"Error de inicio de sesion"
                                                                              delegate:self
                                                                     cancelButtonTitle:@"Cancelar"
                                                                     otherButtonTitles: nil];
                                            [alert show];
                                            
                                           // [self performSegueWithIdentifier:@"segueCerrarSesion" sender:self];
                                            
                                            
                                            
                                        }
                                    }];

}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}


@end
