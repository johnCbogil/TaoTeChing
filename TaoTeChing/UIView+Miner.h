//
//  UIView+Miner.h
//  Miner
//
//

@interface UIView (Miner)

- (void)initialize;

/*!
 Loads a nib, then finds and returns the first view that matches the current class.
 
 @param nibName     name of the nib file. Optional, pass a nil nib name to use the class name.
 @param owner       object to set as nib owner when loading. Optional.
 @param bundle      bundle to load the view from. Optional, will use the main bundle by default.
 @result            A view object, instance of the current class.
 */
+ (id)viewFromNibName:(NSString*)nibName owner:(id)owner bundle:(NSBundle*)bundle;
+ (id)viewFromNibName:(NSString*)nibName owner:(id)owner; // uses the main bundle
+ (id)viewFromNibName:(NSString*)nibName; // uses the main bundle, no owner.
+ (id)viewFromNib; // uses the main bundle, no owner, class name as nibName.

@end

@interface UIView (Transform)

- (void)rotateBy:(CGFloat)radians;
- (void)scaleBy:(CGPoint)scale;

@end

extern CGFloat const kDefaultSpringDamping;

@interface UIView (MNR_Animation)

+ (void)animateWithDuration:(NSTimeInterval)duration usingSpringWithDamping:(CGFloat)dampingRatio  animations:(void (^)(void))animations completion:(void (^)(BOOL finished))completion NS_AVAILABLE_IOS(7_0);

@end

@interface UIView (MNR_Constraints)

/**
 These methods add constraints to a view that will make it resize along with its superview.
 
 When a view is added via an 'embed' segue the automatically-created constraints will make it
 have a fixed size and position. In many cases the desired behavior is for the view to fill the entire
 container and always match its size. These methods update the view-superview constraints to achieve this.
 **/
- (void)applyContainedViewConstraints;

/** 
 Returns the constraints that should be added to achieve the resizing behavior.
 **/
- (NSArray*)containedViewConstraints;


@end