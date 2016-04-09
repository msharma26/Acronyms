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
#import "LfModel.h"

#define urlString @"http://nactem.ac.uk/software/acromine/dictionary.py"

@interface MasterViewController ()

@property (weak, nonatomic) IBOutlet UITextField *shortForm;
@property (nonatomic, strong) NSMutableArray *resultArray;

@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.resultArray = [[NSMutableArray alloc] init];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        DetailViewController *controller = (DetailViewController *)[segue destinationViewController] ;
        controller.longForms = self.resultArray;
    }
}


#pragma mark - IBActions

- (IBAction)getFullForm:(id)sender {
    [self.resultArray removeAllObjects];
    [MBProgressHUD showHUDAddedTo:self.view animated:true];

    NSDictionary *params = @{@"sf": self.shortForm.text};
    
    NSURL *url = [NSURL URLWithString:urlString];
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:url];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];
    
    [manager GET:urlString parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (((NSArray*)responseObject).count > 0) {
            for(NSDictionary *dict in responseObject) {
                if([dict objectForKey:@"lfs"]) {
                    NSUInteger lfsCount = ((NSArray*)[dict objectForKey:@"lfs"]).count;
                    for (int i=0; i<lfsCount; i++) {
                        LfModel *lf = [[LfModel alloc] initWithDict:[dict objectForKey:@"lfs"][i]];
                        [self.resultArray addObject:lf];
                    }
                }
            }
            
            dispatch_async(dispatch_get_main_queue(), ^{
                if ([self.resultArray count] > 0) {
                    [self performSegueWithIdentifier:@"showDetail" sender:self];
                }
                [MBProgressHUD hideHUDForView:self.view animated:YES];

                });

        } else {
            dispatch_async(dispatch_get_main_queue(), ^{
                UIAlertController * alert=   [UIAlertController
                                              alertControllerWithTitle:@"No results"
                                              message:@"No results for this Acronym"
                                              preferredStyle:UIAlertControllerStyleAlert];
                
                UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
                    
                    [MBProgressHUD hideHUDForView:self.view animated:YES];
                }];
                
                [alert addAction:okAction];
                
                UIViewController *vc = [[[[UIApplication sharedApplication] delegate] window] rootViewController];
                [vc presentViewController:alert animated:YES completion:nil];
            });

        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            UIAlertController * alert=   [UIAlertController
                                          alertControllerWithTitle:[NSString stringWithFormat:@"%ld", (long)error.code]
                                          message:[NSString stringWithFormat:@"%@", error.description]
                                          preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
                
                [MBProgressHUD hideHUDForView:self.view animated:YES];
            }];
                
            [alert addAction:okAction];
                
            UIViewController *vc = [[[[UIApplication sharedApplication] delegate] window] rootViewController];
            [vc presentViewController:alert animated:YES completion:nil];
        });
    }];
}


@end
