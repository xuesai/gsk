//
//  GSKLoginViewController.h
//  GSK
//
//  Created by sai on 13-11-17.
//
//

#import <UIKit/UIKit.h>

@interface GSKLoginViewController : UIViewController
@property (nonatomic, strong) IBOutlet UITextField *username;
@property (nonatomic, strong) IBOutlet UITextField *password;

-(IBAction)loginButtonTapped:(id)sender;

@end
