//
//  ListadoPacientes.m
//  JaYinetApp
//
//  Created by Elizabeth Martínez Gómez on 04/04/15.
//  Copyright (c) 2015 Elizabeth Martínez Gómez. All rights reserved.
//

#import "ListadoPacientes.h"
#import <Parse/Parse.h>
#import "ListadoCell.h"



@interface ListadoPacientes ()

@end

@implementation ListadoPacientes

- (void)viewDidLoad {
    [super viewDidLoad];
     self.title=@"LISTADO DE PACIENTES";
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}



- (id)initWithCoder:(NSCoder *)aCoder
{
    self = [super initWithCoder:aCoder];
    if (self) {
        // Custom the table
        
        // The className to query on
        self.parseClassName = @"historial";
        
        // The key of the PFObject to display in the label of the default cell style
        self.textKey = @"desc_estado";
        
        // Whether the built-in pull-to-refresh is enabled
        self.pullToRefreshEnabled = YES;
        
        // Whether the built-in pagination is enabled
        self.paginationEnabled = YES;
        
        // The number of objects to show per page
        self.objectsPerPage = 9;
    }
    return self;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (PFQuery *)queryForTable
{
  //  identificadorPaciente =_idpaciente;
    PFQuery *query = [PFQuery queryWithClassName:@"pacientes"];
  //  [query whereKey:@"objectId" equalTo:identificadorPaciente];
    [query orderByDescending:@"createdAt"];
    
    return query;
}

- (void) objectsDidLoad:(NSError *)error
{
    
    [super objectsDidLoad:error];
}

    
    - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath object:(PFObject *)object {
        static NSString *CellIdentifier = @"CellListado";
        ListadoCell *cell = (ListadoCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        if (cell == nil) {
            cell = [[ListadoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
        
        // Configure the cell
        cell.lblNumero.text = object.objectId;
        NSString *nombreCompleto = [NSString stringWithFormat:@"%@ %@ %@", [object objectForKey:@"nom_paciente"], [object objectForKey:@"ap_paterno"], [object objectForKey:@"ap_materno"]];
        cell.lblNombre.text = nombreCompleto;
        return cell;
    }
    


- (IBAction)btnMenu:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
 
}
@end
