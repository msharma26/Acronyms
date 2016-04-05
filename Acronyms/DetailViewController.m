//
//  DetailViewController.m
//  Acronyms
//
//  Created by Manu Sharma on 4/5/16.
//  Copyright © 2016 Manu Sharma. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController () <UITableViewDataSource>
@property (nonatomic, strong) NSMutableArray *lfArray;
@end

@implementation DetailViewController

#pragma mark - Managing the detail item


- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - TableView datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.longForms.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellId" forIndexPath:indexPath];
    cell.textLabel.text = self.longForms[indexPath.row];
    return cell;

}


@end
