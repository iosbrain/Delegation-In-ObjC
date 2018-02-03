//
//  StatusWheel.m
//  Delegation-In-ObjC
//
//  Created by Andrew Jaffee on 2/1/18.
//
/*
 
 Copyright (c) 2018 Andrew L. Jaffee, microIT Infrastructure, LLC, and
 iosbrain.com.
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 SOFTWARE.
 
*/

#import "StatusWheel.h"

@interface StatusWheel ()

@property (strong, nonatomic) UIActivityIndicatorView *statusIndicator;

@property (strong, nonatomic) UIView *backingView;

@end

@implementation StatusWheel

- (id)init
{
    self = [super init];
    
    if (self)
    {
        return self;
    }
    
    return nil;
}

- (id)initWithOwner: (UIViewController*)viewController;
{
    self = [self init];
    
    if (self)
    {
        self.statusIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        self.statusIndicator.alpha = 0.0;
        
        CGFloat screenWidthCenter = [UIScreen mainScreen].bounds.size.width/2;
        CGFloat screenHeightCenter = [UIScreen mainScreen].bounds.size.height/2;
        self.statusIndicator.center = CGPointMake(screenWidthCenter, screenHeightCenter);

        self.statusIndicator.color = [UIColor whiteColor];
        
        int statusX = self.statusIndicator.frame.origin.x - 6;
        int statusY = self.statusIndicator.frame.origin.y - 6;
        int statusWidth = self.statusIndicator.frame.size.width + 12;
        int statusHeight = self.statusIndicator.frame.size.height + 12;
        
        self.backingView = [[UIView alloc] initWithFrame: CGRectMake (statusX, statusY, statusWidth, statusHeight)];
        self.backingView.backgroundColor = [UIColor lightGrayColor];
        self.backingView.alpha = 0.0;
        
        [viewController.view addSubview:self.backingView];
        [viewController.view bringSubviewToFront:self.backingView];        
        [viewController.view addSubview:self.statusIndicator];
        [viewController.view bringSubviewToFront:self.statusIndicator];
        
        UITapGestureRecognizer *singleTap =
            [[UITapGestureRecognizer alloc] initWithTarget:self
                                                    action:@selector(handleSingleTap:)];
        [self.backingView addGestureRecognizer:singleTap];
        
        return self;
    }
    
    return nil;
}

- (void)show
{
    self.statusIndicator.alpha = 1.0;
    self.backingView.alpha = 1.0;
    [self.statusIndicator startAnimating];
    [self.delegate wasAddedToScreen:self];
}

- (void)hide
{
    [self.statusIndicator stopAnimating];
    self.statusIndicator.alpha = 0.0;
    self.backingView.alpha = 0.0;
    [self.delegate wasRemovedFromScreen:self];
}

- (void)handleSingleTap:(UITapGestureRecognizer *)recognizer
{
    [self.delegate wasTapped:self];
}

@end
