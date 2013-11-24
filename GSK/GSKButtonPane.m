//
//  GSKButtonPane.m
//  GSK
//
//  Created by sai on 13-11-21.
//
//

#import "GSKButtonPane.h"

#define kTotalButtonNum 7
#define kButtonWidth 80
#define kButtonHeight 50

static NSString *icons[] = {@"matchVideo",
    @"matchVideo",
    @"matchVideo",
    @"matchVideo",
    @"matchVideo",
    @"matchVideo",
    @"matchVideo",
};

static NSString *iconsHilight[] = {@"matchVideoHi",
    @"matchVideoHi",
    @"matchVideoHi",
    @"matchVideoHi",
    @"matchVideoHi",
    @"matchVideoHi",
    @"matchVideoHi",
};

static NSString *titles[] = {
    @"System",
    @"Contact",
    @"Help",
    @"Mail GM",
    @"EMeeting",
    @"Video",
    @"Setting",
};


@implementation GSKButtonPane
@synthesize paneDelegate = _paneDelegate;
@synthesize selectedButtonTag = _selectedButtonTag;

- (void)buttonTapped:(UIButton*)aSender {
    if (aSender.tag != _selectedButtonTag) {
        UIButton *lastSelectedBtn = (UIButton*)[self viewWithTag:_selectedButtonTag];
        lastSelectedBtn.selected = NO;
        aSender.selected = YES;
        _selectedButtonTag = aSender.tag;
        
        if ([_paneDelegate respondsToSelector:@selector(buttonTappedAtIndex:)]) {
            [_paneDelegate buttonTappedAtIndex:aSender.tag];
        }
    }
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor lightGrayColor];

        //7 buttons
        for (int i=0;i<kTotalButtonNum;i++) {
            UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, i*100 + 25, kButtonWidth, kButtonHeight)];
            btn.tag = i + 1;
            [btn setImage:[UIImage imageNamed:icons[i]] forState:UIControlStateNormal];
            [btn setImage:[UIImage imageNamed:iconsHilight[i]] forState:UIControlStateHighlighted];
            [btn setTitle:titles[i] forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:btn];
            
            if (i == 0) {
                btn.selected = YES;
                _selectedButtonTag = btn.tag;
            }
            debugView(btn);
        }
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    UIView *lastBtn = [self viewWithTag:kTotalButtonNum];
    lastBtn.bottom = self.bottom - 25;
}

@end
