//
//  GMViewController.m
//  animationDemo
//
//  Created by lerosua on 14-7-24.
//  Copyright (c) 2014年 lerosua. All rights reserved.
//

#import "GMBasicViewController.h"

@interface GMBasicViewController ()<CAMediaTiming>
@property (weak, nonatomic) IBOutlet UIView *animationView;

- (IBAction)moveAnimation:(id)sender;
- (IBAction)scaleAnimation:(id)sender;
- (IBAction)moveAndBackAnimation:(id)sender;

@end

@implementation GMBasicViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
//    NSLog(@"frame %@",NSStringFromCGRect(_animationView.frame));
//    [_animationView.layer removeAllAnimations];
//    NSLog(@"frame %@",NSStringFromCGRect(_animationView.frame));
//
//}

- (IBAction)moveAnimation:(id)sender {

    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"position";
    animation.fromValue = [NSValue valueWithCGPoint:CGPointMake(160, 64)];
    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(160, 508)];
    animation.duration = 2;
//    animation.beginTime = 1 + CACurrentMediaTime();
    
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    animation.delegate = self;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    
    [_animationView.layer addAnimation:animation forKey:nil];

    
}

- (IBAction)scaleAnimation:(id)sender {
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"transform";
    animation.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
    animation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(3.3, 3.3, 1)];
    animation.duration = 0.5;
    animation.autoreverses = YES;
    animation.repeatCount = NSIntegerMax;
    
    [_animationView.layer addAnimation:animation forKey:nil];
}

- (IBAction)moveAndBackAnimation:(id)sender {
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"position";
    animation.fromValue = [NSValue valueWithCGPoint:CGPointMake(160, 0)];
    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(160, 508)];
    animation.duration = 2;
    animation.autoreverses = YES;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    [_animationView.layer addAnimation:animation forKey:nil];
}
@end
