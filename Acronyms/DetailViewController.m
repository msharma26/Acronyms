//
//  DetailViewController.m
//  Acronyms
//
//  Created by Manu Sharma on 4/5/16.
//  Copyright © 2016 Manu Sharma. All rights reserved.
//

#import "DetailViewController.h"
#import "LfModel.h"
#import "VariationsViewContoller.h"

@interface DetailViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) NSArray *variationArrayToPass;
@end

@implementation DetailViewController


- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showVariations"]) {
        VariationsViewContoller *controller = (VariationsViewContoller *)[segue destinationViewController] ;
        controller.variationArray = self.variationArrayToPass;
    }
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
    if ([lf hasVariations]) {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    return cell;
}

#pragma mark - TableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    LfModel *lf = self.longForms [indexPath.row];
    if ([lf hasVariations]) {
        self.variationArrayToPass = [lf fetchVariationArray];
        [self performSegueWithIdentifier:@"showVariations" sender:self];
    }
}


@end
