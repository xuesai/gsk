//
//  GSKLoginViewController.m
//  GSK
//
//  Created by sai on 13-11-17.
//
//

#import "GSKLoginViewController.h"
#import "GSKHomeViewController.h"


@interface GSKLoginViewController ()

@end

@implementation GSKLoginViewController
@synthesize username = _username;
@synthesize password = _password;

-(IBAction)loginButtonTapped:(id)sender {
    GSKHomeViewController *homeViewController = [[GSKHomeViewController alloc] initWithNibName:@"GSKHomeViewController" bundle:nil];
    [self.navigationController pushViewController:homeViewController animated:YES];
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}



@end
