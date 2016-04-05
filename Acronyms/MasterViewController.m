//
//  MasterViewController.m
//  Acronyms
//
//  Created by Manu Sharma on 4/5/16.
//  Copyright © 2016 Manu Sharma. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "MBProgressHUD.h"
#import "AFNetworking.h"
#import "LongForm.h"

#define urlString @"http://nactem.ac.uk/software/acromine/dictionary.py"

@interface MasterViewController ()

@property (weak, nonatomic) IBOutlet UITextField *shortForm;
@property (nonatomic, strong) NSMutableArray *resultArray;

@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    self.resultArray = [[NSMutableArray alloc] init];

  self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
}

- (void)viewWillAppear:(BOOL)animated {
    [self.resultArray removeAllObjects];
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        DetailViewController *controller = (DetailViewController *)[[segue destinationViewController] topViewController];
        //[controller setDetailItem:object];
        controller.longForms = self.resultArray;
        //[self.resultArray removeAllObjects];
        controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
        controller.navigationItem.leftItemsSupplementBackButton = YES;
    }
}
#pragma mark - IBActions

- (IBAction)getFullForm:(id)sender {
    [MBProgressHUD showHUDAddedTo:self.view animated:true];

    
    NSDictionary *params = @{@"sf": self.shortForm.text};
    
    NSURL *url = [NSURL URLWithString:urlString];
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:url];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];
    
    [manager GET:urlString parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        //NSLog(@"%@", downloadProgress.);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {

        NSDictionary *dict = responseObject[0];
        NSUInteger lfsCount = ((NSArray*)[dict objectForKey:@"lfs"]).count;
        for (int i=0; i<lfsCount; i++) {

            [self.resultArray addObject:[[dict objectForKey:@"lfs"][i] objectForKey:@"lf"]];
            
        }
        if ([self.resultArray count] > 0) {
            [self performSegueWithIdentifier:@"showDetail" sender:self];
        }
        [MBProgressHUD hideHUDForView:self.view animated:YES];

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    }];
    
    
}


@end
