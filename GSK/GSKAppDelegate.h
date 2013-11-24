//
//  GSKAppDelegate.h
//  GSK
//
//  Created by sai on 13-11-17.
//
//

#import <UIKit/UIKit.h>
#import "GSKSideBar.h"
#import <MessageUI/MessageUI.h>

@interface GSKAppDelegate : UIResponder <UIApplicationDelegate,MFMailComposeViewControllerDelegate, ButtonPaneDelegate>
@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) GSKSideBar *sidebar;

+ (GSKAppDelegate*)appDelegate;

@end
