//
//  DetailViewController.m
//  Acronyms
//
//  Created by Manu Sharma on 4/5/16.
//  Copyright © 2016 Manu Sharma. All rights reserved.
//

#import "DetailViewController.h"
#import "LfModel.h"

@interface DetailViewController () <UITableViewDataSource>

@end

@implementation DetailViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - TableView datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.longForms.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellId" forIndexPath:indexPath];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"CellId"];
    }
    LfModel *lf = self.longForms [indexPath.row];
    cell.textLabel.text = [lf fetchLongForm];
    cell.detailTextLabel.text = [lf fetchDescription];
    return cell;
}


@end
