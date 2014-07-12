//
//  LHSetupViewController.m
//  Allergy
//
//  Created by Xinlei Xu on 7/12/14.
//  Copyright (c) 2014 LinkedIn Hackday. All rights reserved.
//

#import "LHSetupViewController.h"

@interface LHSetupViewController ()

@property (nonatomic, strong) UIButton *checkButton;
@property (nonatomic, strong) UIButton *crossButton;

@end

@implementation LHSetupViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.done = [NSNumber numberWithBool:NO];
    
    NSArray *sadArray = @[@"Cereal", @"Corn", @"Egg", @"Fish", @"Gluten", @"Lactose", @"Milk", @"Peanut", @"Sesame Seed", @"Shellfish", @"Soybean", @"Sulfite", @"Tree Nuts", @"Wheat"];
    self.photoTitles = [NSMutableArray arrayWithArray:sadArray];// @[@"egg", @"shellfish"]];
    // Do any additional setup after loading the view.
    CGRect bounds = [self.view bounds];
    if ([self.photoTitles count] == 0) {
        return;
    }
    NSString *photoTitle = [self.photoTitles firstObject];
    [self.photoTitles removeObjectAtIndex:0];
    
    self.photo = [[UIImageView alloc] initWithFrame:bounds];
    [self.photo setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg", photoTitle]]];
    self.photo.clipsToBounds = YES;
    [self.view addSubview:self.photo];

    [self.tabBarItem setTitle:photoTitle];
    [self.tabBarItem setTitlePositionAdjustment:UIOffsetMake(0, -15)];
    
    self.crossButton = [[UIButton alloc]initWithFrame:CGRectMake(bounds.origin.x + 20, bounds.origin.y + bounds.size.height - 120, 54, 54)];
    [self.crossButton setBackgroundImage:[UIImage imageNamed:@"Cross.png"] forState:UIControlStateNormal];
    [self.view addSubview:self.crossButton];
    [self.crossButton addTarget:self action:@selector(onCross) forControlEvents:UIControlEventTouchUpInside];
    
    self.checkButton = [[UIButton alloc]initWithFrame:CGRectMake(bounds.origin.x + bounds.size.width - 88 , bounds.origin.y + 44 , 54, 54)];
    [self.checkButton setBackgroundImage:[UIImage imageNamed:@"Check.png"] forState:UIControlStateNormal];
    [self.view addSubview:self.checkButton];
    
    [self.checkButton addTarget:self action:@selector(onCheck) forControlEvents:UIControlEventTouchUpInside];
    
    /*
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageTapped:)];
    singleTap.numberOfTapsRequired = 1;
    singleTap.numberOfTouchesRequired = 1;
    [self addGestureRecognizer:singleTap];
    [self setUserInteractionEnabled:YES];*/
    
}
- (void)onCheck
{
    //save to some data base
    
    if ([self.photoTitles count] == 0) {
        //update stuff
        self.done = [NSNumber numberWithBool:YES];
        return;
    }
    
    [self.photo removeFromSuperview];
    
    NSString *photoTitle = [self.photoTitles firstObject];
    self.photo = [[UIImageView alloc] initWithFrame:self.view.bounds];
    [self.photo setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg", photoTitle]]];
    [self.photoTitles removeObjectAtIndex:0];
    
    [self.view addSubview:self.photo];
    [self.tabBarItem setTitle:photoTitle];
    
    //with animation
    [self.view bringSubviewToFront:self.checkButton];
    [self.view bringSubviewToFront:self.crossButton];

}
- (void)onCross
{
    if ([self.photoTitles count] == 0) {
        //update stuff
        self.done = [NSNumber numberWithBool:YES];
        return;
    }
    
    [self.photo removeFromSuperview];
    
    NSString *photoTitle = [self.photoTitles firstObject];
    self.photo = [[UIImageView alloc] initWithFrame:self.view.bounds];
    [self.photo setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg", photoTitle]]];
    [self.photoTitles removeObjectAtIndex:0];
    
    [self.view addSubview:self.photo];
    [self.tabBarItem setTitle:photoTitle];
    
    //with animation
    [self.view bringSubviewToFront:self.checkButton];
    [self.view bringSubviewToFront:self.crossButton];
}

- (void)imageTapped
{
    return;
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

@end