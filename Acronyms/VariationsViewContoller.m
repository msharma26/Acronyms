//
//  VariationsViewContoller.m
//  Acronyms
//
//  Created by Manu Sharma on 4/9/16.
//  Copyright © 2016 Manu Sharma. All rights reserved.
//

#import "VariationsViewContoller.h"
#import "LfVarModel.h"

@interface VariationsViewContoller ()

@end

@implementation VariationsViewContoller

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - TableView datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.variationArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"varCellId" forIndexPath:indexPath];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"varCellId"];
    }
    LfVarModel *lfv = self.variationArray [indexPath.row];
    cell.textLabel.text = [lfv fetchLongForm];
    cell.detailTextLabel.text = [lfv fetchDescription];
    return cell;
}

@end
