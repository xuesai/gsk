//
//  GSKAppDelegate.m
//  GSK
//
//  Created by sai on 13-11-17.
//
//

#import "GSKAppDelegate.h"
#import "GSKLoginViewController.h"
#import "GSKHomeViewController.h"
#import "GSKNavigationController.h"
#import "GSKVideoViewController.h"
#import "GSKContactsViewController.h"
#import "GSKHelpViewController.h"

@implementation GSKAppDelegate
@synthesize sidebar = _sidebar;

- (void)toHomeViewController {
    [(UINavigationController*)(self.window.rootViewController) popToRootViewControllerAnimated:YES];
}

- (void)toContactsViewController {
    [(UINavigationController*)(self.window.rootViewController) popToRootViewControllerAnimated:NO];
    GSKContactsViewController *contactsVC = [[GSKContactsViewController alloc] initWithNibName:@"GSKContactsViewController" bundle:nil];
    [(UINavigationController*)(self.window.rootViewController) pushViewController:contactsVC animated:YES];
}

- (void)toHelpViewController {
    [(UINavigationController*)(self.window.rootViewController) popToRootViewControllerAnimated:NO];
    GSKHelpViewController *helpVC = [[GSKHelpViewController alloc] initWithNibName:@"GSKHelpViewController" bundle:nil];
    [(UINavigationController*)(self.window.rootViewController) pushViewController:helpVC animated:YES];
}

- (void)mailGM {
    Class mailClass = (NSClassFromString(@"MFMailComposeViewController"));
    if (mailClass != nil)
    {
        // We must always check whether the current device is configured for sending emails
        if ([mailClass canSendMail])
        {
            MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
            mc.modalPresentationStyle = UIModalPresentationFormSheet;
            mc.mailComposeDelegate = self;
            [mc setSubject:@"Hello"];
            [mc setToRecipients:[NSArray arrayWithObjects:@"newlc@126.com",nil]];
            [mc setMessageBody:@"body" isHTML:NO];
            [(UINavigationController*)(self.window.rootViewController) presentViewController:mc animated:YES completion:nil];

        }
    }
}

- (void)eMeeting {
    if ([self appIsInstalled:@"webex"]) {
        //launch ?
    } else {
        [[[UIAlertView alloc] initWithTitle:nil message:@"not installed" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil] show];
    }
}

- (void)toVidelViewController {
    [(UINavigationController*)(self.window.rootViewController) popToRootViewControllerAnimated:NO];
    GSKVideoViewController *videoVC = [[GSKVideoViewController alloc] initWithNibName:@"GSKVideoViewController" bundle:nil];
    [(UINavigationController*)(self.window.rootViewController) pushViewController:videoVC animated:YES];
}

- (void)toSetting {
    
}

- (BOOL)appIsInstalled:(NSString*)nameOfApp {
    return [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:nameOfApp]];
}

+ (GSKAppDelegate*)appDelegate {
    return (GSKAppDelegate*)[[UIApplication sharedApplication] delegate];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
//    GSKLoginViewController *loginViewController = [[GSKLoginViewController alloc] initWithNibName:@"GSKLoginViewController" bundle:nil];
    GSKHomeViewController *homeVC = [[GSKHomeViewController alloc] initWithNibName:@"GSKHomeViewController" bundle:nil];
    GSKNavigationController *naviVC = [[GSKNavigationController alloc] initWithRootViewController:homeVC];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = naviVC;

    [self.window makeKeyAndVisible];
    
    _sidebar = [[GSKSideBar alloc] init];

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma ButtonPaneDelegate
- (void)buttonTappedAtIndex:(NSUInteger)aIndex {
    if (aIndex == 1) {
        [self toHomeViewController];
    } else if (aIndex == 2) {
        [self toContactsViewController];
    } else if (aIndex == 3) {
        [self toHelpViewController];
    } else if (aIndex == 4) {
        [self mailGM];
    } else if (aIndex == 5) {
        [self eMeeting];
    } else if (aIndex == 6) {
        [self toVidelViewController];
    } else if (aIndex == 7) {
        [self toSetting];
    }
}

#pragma MFMailComposeViewControllerDelegate
- (void)mailComposeController:(MFMailComposeViewController*)controller
          didFinishWithResult:(MFMailComposeResult)result
                        error:(NSError*)error {
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail send canceled...");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved...");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail sent...");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail send errored: %@...", [error localizedDescription]);
            break;
        default:
            break;
    }
    
    [(UINavigationController*)(self.window.rootViewController) dismissViewControllerAnimated:YES completion:nil];
}

@end
