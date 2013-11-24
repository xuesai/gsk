//
//  GSKHomeViewController.m
//  GSK
//
//  Created by sai on 13-11-17.
//
//

#import "GSKHomeViewController.h"
#import "AFURLSessionManager.h"
#import "GSKWebViewController.h"
#import "GSKVideoViewController.h"

@interface GSKHomeViewController ()

@end

@implementation GSKHomeViewController





- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    self.title = NSLocalizedStringFromTable(@"title",@"language_en", nil);
//    self.navigationController.navigationBarHidden = YES;
    if ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0) {
        self.edgesForExtendedLayout = UIRectEdgeBottom;
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    NSLog(@"orientation = %d", toInterfaceOrientation);
}
@end
