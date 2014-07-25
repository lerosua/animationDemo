//
//  GMTransitionViewController.m
//  animationDemo
//
//  Created by lerosua on 14-7-24.
//  Copyright (c) 2014年 lerosua. All rights reserved.
//

#import "GMTransitionViewController.h"

@interface GMTransitionViewController ()
@property (weak, nonatomic) IBOutlet UIView *animationView;

- (IBAction)AbuttonAction:(id)sender;
- (IBAction)BbuttonAction:(id)sender;
- (IBAction)moveInAction:(id)sender;
- (IBAction)revealAction:(id)sender;
- (IBAction)resetAction:(id)sender;
@end

@implementation GMTransitionViewController

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

- (IBAction)AbuttonAction:(id)sender {
    
//    _animationView.frame = CGRectMake(-300, 160, 200, 200);
    CATransition *transition = [CATransition animation];
     //細部設定
    [transition setDuration:1.0f];
    //動畫內容
     [transition setType:kCATransitionFade];
     [transition setSubtype:kCATransitionFromLeft];

     //執行動畫
    [_animationView.layer addAnimation:transition forKey:@"myTransitionA"];
    _animationView.hidden = YES;


    
}

- (IBAction)BbuttonAction:(id)sender {

//    _animationView.frame = CGRectMake(-300, 160, 200, 200);
    
    CATransition *transition = [CATransition animation];
    //細部設定
    [transition setDuration:1.0f];
    //動畫內容
    [transition setType:kCATransitionPush];
    [transition setSubtype:kCATransitionFromRight];
    //執行動畫
    [_animationView.layer addAnimation:transition forKey:@"myTransitionB"];
    _animationView.hidden = YES;


}

- (IBAction)moveInAction:(id)sender {

    CATransition *transition = [CATransition animation];
    //細部設定
    [transition setDuration:1.0f];
    //動畫內容
    [transition setType:kCATransitionMoveIn];
    [transition setSubtype:kCATransitionFromBottom];
    //執行動畫
    [_animationView.layer addAnimation:transition forKey:@"myTransitionC"];

    _animationView.hidden = YES;

}

- (IBAction)revealAction:(id)sender {

    CATransition *transition = [CATransition animation];
    //細部設定
    [transition setDuration:1.0f];
    //動畫內容
    [transition setType:kCATransitionReveal];
    [transition setSubtype:kCATransitionFromTop];
    //執行動畫
    [_animationView.layer addAnimation:transition forKey:@"myTransitionD"];
    _animationView.hidden = YES;


}

- (IBAction)resetAction:(id)sender {
    _animationView.hidden = NO;
}
@end
