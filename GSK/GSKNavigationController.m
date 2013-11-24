//
//  GSKNavigationController.m
//  GSK
//
//  Created by sai on 13-11-20.
//
//

#import "GSKNavigationController.h"

@interface GSKNavigationController ()

@end

@implementation GSKNavigationController

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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSUInteger) supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskAll;
}

- (BOOL) shouldAutorotate {
    return YES;
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    NSLog(@"orientation = %d", toInterfaceOrientation);
}


@end
