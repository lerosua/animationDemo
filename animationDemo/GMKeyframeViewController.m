//
//  GMKeyframeViewController.m
//  animationDemo
//
//  Created by lerosua on 14-7-24.
//  Copyright (c) 2014年 lerosua. All rights reserved.
//

#import "GMKeyframeViewController.h"

@interface GMKeyframeViewController ()
@property (weak, nonatomic) IBOutlet UIView *animationView;

- (IBAction)valuesAnimation:(id)sender;
- (IBAction)pathAnimation:(id)sender;
@end

@implementation GMKeyframeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)valuesAnimation:(id)sender {
    CAKeyframeAnimation *bounce = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    
    ///设置动画
    CATransform3D forward = CATransform3DMakeScale(1.3, 1.3, 1);
    CATransform3D back = CATransform3DMakeScale(0.7, 0.7, 1);
    CATransform3D forward2 = CATransform3DMakeScale(1.2, 1.2, 1);
    CATransform3D back2 = CATransform3DMakeScale(0.9, 0.9, 1);
    
    [bounce setValues:[NSArray arrayWithObjects:
                       [NSValue valueWithCATransform3D:CATransform3DIdentity],
                       [NSValue valueWithCATransform3D:forward],
                       [NSValue valueWithCATransform3D:back],
                       [NSValue valueWithCATransform3D:forward2],
                       [NSValue valueWithCATransform3D:back2],
                       [NSValue valueWithCATransform3D:CATransform3DIdentity],nil]];
    
    [bounce setDuration:1];
    
    [_animationView.layer addAnimation:bounce forKey:@"bounceAnimation"];
}

- (IBAction)pathAnimation:(id)sender {
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(-40, 100)];
    [path addLineToPoint:CGPointMake(360, 100)];
    [path addLineToPoint:CGPointMake(360, 200)];
    [path addLineToPoint:CGPointMake(-40, 200)];
    [path addLineToPoint:CGPointMake(-40, 300)];
    [path addLineToPoint:CGPointMake(360, 300)];
    
    CAKeyframeAnimation *moveAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    moveAnimation.path = path.CGPath;
    moveAnimation.duration = 8.0f;
    moveAnimation.rotationMode = kCAAnimationRotateAuto;
    [_animationView.layer addAnimation:moveAnimation forKey:@"moveAnimation"];
}
@end
