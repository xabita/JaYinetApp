//
//  HistorialEstatus.m
//  JaYinetApp
//
//  Created by Elizabeth Martínez Gómez on 04/04/15.
//  Copyright (c) 2015 Elizabeth Martínez Gómez. All rights reserved.
//

#import "HistorialEstatus.h"
#import <parse/Parse.h>
#import "EstatusCell.h"

NSString *identificadorPaciente;


@interface HistorialEstatus ()

@end

@implementation HistorialEstatus

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




- (void)viewDidLoad {
    [super viewDidLoad];
       identificadorPaciente =_idpaciente;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


- (PFQuery *)queryForTable
{
    identificadorPaciente =_idpaciente;
    PFQuery *query = [PFQuery queryWithClassName:@"historial"];
    [query whereKey:@"id_pac" equalTo:identificadorPaciente];
    [query orderByDescending:@"createdAt"];
    
    return query;
}

- (void) objectsDidLoad:(NSError *)error
{
    
    [super objectsDidLoad:error];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath object:(PFObject *)object {
    
    
    static NSString *CellIdentifier = @"CellEstatus";
    
    EstatusCell *cell = (EstatusCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[EstatusCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell
    cell.lblEstatus.text = [object objectForKey:@"desc_estado"];
    // NSLog(@"Pacienteeeeeee %@", identificadorPaciente);
    
    return cell;
}


- (IBAction)btnMenu:(UIBarButtonItem *)sender {
 [self dismissViewControllerAnimated:YES completion:nil];
}

@end
