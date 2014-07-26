//
//  GMTransactionViewController.m
//  animationDemo
//
//  Created by lerosua on 14-7-24.
//  Copyright (c) 2014年 lerosua. All rights reserved.
//

#import "GMTransactionViewController.h"

@interface GMTransactionViewController ()
@property (weak, nonatomic) IBOutlet UIView *animationView;
@property (nonatomic,strong) CALayer *layer;
@property (weak, nonatomic) IBOutlet UIView *animationRedView;

- (IBAction)animationAction:(id)sender;

@end

@implementation GMTransactionViewController

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

    self.layer = [[CALayer alloc] init];
    self.layer.backgroundColor = [UIColor blueColor].CGColor;
    self.layer.frame = CGRectMake(67, 64, 200, 200);
    [self.view.layer addSublayer:self.layer];
    
    NSLog(@"present layer %@",[self.animationView.layer presentationLayer]);
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

- (IBAction)animationAction:(id)sender {
    [CATransaction begin];


    [CATransaction setAnimationDuration:4];

    self.layer.cornerRadius = (self.layer.cornerRadius == 0.0f) ? 100.0f : 0.0f;
//    self.layer.frame = CGRectMake(200, 100, 100, 100);
    self.animationView.layer.cornerRadius = (self.animationView.layer.cornerRadius == 0.0f)?100.0f:0.0f;

//}];

    
    [CATransaction commit];
}


@end
