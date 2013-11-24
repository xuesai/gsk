//
//  GSKButtonPane.h
//  GSK
//
//  Created by sai on 13-11-21.
//
//

#import <UIKit/UIKit.h>

@protocol ButtonPaneDelegate <NSObject>
@required
- (void)buttonTappedAtIndex:(NSUInteger)aIndex;
@end

@interface GSKButtonPane : UIView
@property (nonatomic, assign) NSUInteger selectedButtonTag;
@property (nonatomic, assign) id<ButtonPaneDelegate> paneDelegate;
@end
