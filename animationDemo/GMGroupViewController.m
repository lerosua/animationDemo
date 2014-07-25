//
//  GMGroupViewController.m
//  animationDemo
//
//  Created by lerosua on 14-7-24.
//  Copyright (c) 2014年 lerosua. All rights reserved.
//

#import "GMGroupViewController.h"

CGFloat DegreesToRadians(CGFloat degrees) {return degrees * M_PI / 180;};

@interface GMGroupViewController ()
@property (weak, nonatomic) IBOutlet UILabel *animationLabel;
- (IBAction)rotateAction:(id)sender;

- (IBAction)moveAction:(id)sender;
- (IBAction)groupAction:(id)sender;

@end

@implementation GMGroupViewController

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

- (IBAction)rotateAction:(id)sender {
    CABasicAnimation *rotateAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotateAnimation.toValue = @(M_PI * 2.0);
    rotateAnimation.duration = 2;
    
    
    
    [_animationLabel.layer addAnimation:rotateAnimation forKey:@"rotate"];
}

- (IBAction)moveAction:(id)sender {
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"position.x"];
    basicAnimation.toValue = @(300);
    basicAnimation.duration = 1;
    basicAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    
    [_animationLabel.layer addAnimation:basicAnimation forKey:@"move"];
}

- (IBAction)groupAction:(id)sender {
    CAAnimationGroup *group = [CAAnimationGroup animation];
    
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"position.x"];
    basicAnimation.toValue = @(300);
    basicAnimation.duration = 1;
    basicAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    basicAnimation.removedOnCompletion = NO;
    basicAnimation.fillMode = kCAFillModeForwards;
    
    CABasicAnimation *rotateAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotateAnimation.toValue = @(M_PI * 2.0);
    rotateAnimation.duration = 1;
    
    
    CABasicAnimation *move2Animation = [CABasicAnimation animationWithKeyPath:@"position.y"];
    move2Animation.toValue = @(300);
    move2Animation.duration = 1;
    move2Animation.beginTime = 1;
    
    group.animations = @[basicAnimation,rotateAnimation,move2Animation];
    group.duration=2;
    [_animationLabel.layer addAnimation:group forKey:@"group"];
}
@end
