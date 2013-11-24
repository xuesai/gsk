//
//  GSKSideBar.m
//  GSK
//
//  Created by sai on 13-11-17.
//
//

#import "GSKSideBar.h"
#import "GSKButtonPane.h"
#import "GSKAppDelegate.h"

#define kToolbarWidth 80



@implementation GSKSideBar
{
    GSKButtonPane *_pane;
}

- (void)deviceOrientationDidChanged:(NSNotification*)aNotification {
    [self setSideBarOrientation:[UIDevice currentDevice].orientation];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIDeviceOrientationDidChangeNotification object:nil];
}

- (id)init
{
    self = [super init];
    self.hidden = NO;
    self.alpha = 1.0f;
    self.windowLevel = UIWindowLevelNormal;
    self.frame = CGRectMake(0, 0, kToolbarWidth, 748);
    self.backgroundColor = [UIColor clearColor];
    
    _pane = [[GSKButtonPane alloc] initWithFrame:self.bounds];
    _pane.paneDelegate = [GSKAppDelegate appDelegate];
    [self addSubview:_pane];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(deviceOrientationDidChanged:) name:UIDeviceOrientationDidChangeNotification object:nil];

    debugView(self);
    return self;
}

- (void)setSideBarOrientation:(UIDeviceOrientation)aDeviceOrientation {
    CGRect screen = [UIScreen mainScreen].bounds;
    NSLog(@"orientation = %d", aDeviceOrientation);
    
    [UIView beginAnimations:@"toolbarAnimation" context:nil];
    [UIView setAnimationDuration:.2];
    
    if (aDeviceOrientation == UIDeviceOrientationPortrait) {
        self.transform = CGAffineTransformIdentity;
        self.top = 20 + kNaviBarHeight;
        self.left = 0;
        self.width = kToolbarWidth;
        self.height = screen.size.height - 20 - kNaviBarHeight;
        _pane.height = self.height;
    } else if (aDeviceOrientation == UIDeviceOrientationPortraitUpsideDown) {
        self.transform = CGAffineTransformIdentity;
        self.transform = CGAffineTransformMakeTranslation(screen.size.width/2, screen.size.height/2);
        self.transform = CGAffineTransformMakeRotation(M_PI);
        self.width = kToolbarWidth;
        self.height = screen.size.height - 20 - kNaviBarHeight;
        self.left = screen.size.width - self.width;
        self.top = 0;
        _pane.height = self.height;
    } else if (aDeviceOrientation == UIDeviceOrientationLandscapeLeft) {
        self.transform = CGAffineTransformIdentity;
        self.transform = CGAffineTransformMakeTranslation(self.size.width/2, self.size.height/2);
        self.transform = CGAffineTransformMakeRotation(M_PI_2);
        self.width = screen.size.width - 20  - kNaviBarHeight;
        self.height = kToolbarWidth;
        self.left = 0;
        self.top = 0;
        _pane.height = self.width;
    } else if (aDeviceOrientation == UIDeviceOrientationLandscapeRight) {
        self.transform = CGAffineTransformIdentity;
        self.transform = CGAffineTransformMakeTranslation(self.size.width/2, self.size.height/2);
        self.transform = CGAffineTransformMakeRotation(-1*M_PI_2);
        self.width = screen.size.width - 20 - kNaviBarHeight;
        self.height = kToolbarWidth;
        self.left = screen.size.width - self.width;
        self.top = screen.size.height - self.height;
        _pane.height = self.width;
    }
    
    [UIView commitAnimations];

    [_pane setNeedsLayout];
    [_pane layoutIfNeeded];
}

@end
