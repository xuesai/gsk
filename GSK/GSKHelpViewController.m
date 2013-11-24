//
//  GSKHelpViewController.m
//  GSK
//
//  Created by sai on 13-11-21.
//
//

#import "GSKHelpViewController.h"

@interface GSKHelpViewController ()

@end

@implementation GSKHelpViewController
{
    UIDocumentInteractionController *_docController;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)test {
    NSURL *URL = [[NSBundle mainBundle] URLForResource:@"saml" withExtension:@"pdf"];
    _docController = [UIDocumentInteractionController interactionControllerWithURL:URL];
    _docController.delegate = self;
    [_docController presentPreviewAnimated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 80, 120, 40)];
    [btn setTitle:@"open pdf" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(test) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma UIDocumentInteractionControllerDelegate
- (UIViewController *) documentInteractionControllerViewControllerForPreview:  (UIDocumentInteractionController *) controller {
    return self;
}

@end
