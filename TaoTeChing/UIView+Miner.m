//
//  UIView+Equinox.m
//  Equinox
//
//  Created by Pedro Mancheno on 12/3/13.
//  Copyright (c) 2013 Fernando Mazzon. All rights reserved.
//

#import "UIView+Miner.h"
#import <UIKit/UIKit.h>

#import <QuartzCore/CALayer.h>

@implementation UIView (Miner)

#pragma mark -

- (void)initialize
{
    // abstract
}

#pragma mark -

+ (id)viewFromNibName:(NSString*)nibName owner:(id)owner bundle:(NSBundle*)bundle
{
    if (!nibName)
        nibName = NSStringFromClass(self);
    
    if (!bundle)
        bundle = [NSBundle mainBundle];
    
#if DEBUG == 1
    if (![bundle pathForResource:nibName ofType:@"nib"]) {
        NSLog(@"nib not found: '%@'", nibName);
        return nil;
    }
#endif
    
    NSArray *nibObjects = [bundle loadNibNamed:nibName owner:owner options:nil];
    id viewObject = [nibObjects match:^BOOL(id obj){
        return [obj isKindOfClass:self];
    }];
    
#if DEBUG == 1
    if (!viewObject) {
        NSLog(@"view of class '%@' not found in nib '%@'", self, nibName);
        return nil;
    }
#endif
    
    return viewObject;
}

+ (id)viewFromNibName:(NSString*)nibName owner:(id)owner
{
    return [self viewFromNibName:nibName owner:owner bundle:nil];
}
+ (id)viewFromNibName:(NSString*)nibName
{
    return [self viewFromNibName:nibName owner:nil bundle:nil];
}
+ (id)viewFromNib
{
    return [self viewFromNibName:nil owner:nil bundle:nil];
}

@end

@implementation UIView (Transform)

- (void)rotateBy:(CGFloat)radians
{
    self.layer.affineTransform = CGAffineTransformRotate(self.layer.affineTransform, radians);
}

- (void)scaleBy:(CGPoint)scale
{
    self.layer.affineTransform = CGAffineTransformScale(CGAffineTransformIdentity, scale.x, scale.y);
}

@end

CGFloat const kDefaultSpringDamping = 0.8;

@implementation UIView (MNR_Animation)

+ (void)animateWithDuration:(NSTimeInterval)duration usingSpringWithDamping:(CGFloat)dampingRatio  animations:(void (^)(void))animations completion:(void (^)(BOOL finished))completion
{
    [self animateWithDuration:duration
                        delay:0
       usingSpringWithDamping:dampingRatio
        initialSpringVelocity:0
                      options:UIViewAnimationOptionCurveEaseOut
                   animations:animations
                   completion:completion];
}

@end

@implementation UIView (MNR_Constraints)


- (void)applyContainedViewConstraints
{
    self.translatesAutoresizingMaskIntoConstraints = NO;
    [self.superview addConstraints:[self containedViewConstraints]];
}

- (NSArray*)containedViewConstraints
{
    NSDictionary *views = NSDictionaryOfVariableBindings(self);
    
    return [[NSLayoutConstraint constraintsWithVisualFormat: @"V:|-0-[self]-0-|" options:0 metrics:nil views:views]
            arrayByAddingObjectsFromArray:
            [NSLayoutConstraint constraintsWithVisualFormat: @"H:|-0-[self]-0-|" options:0 metrics:nil views:views]];
}

@end

