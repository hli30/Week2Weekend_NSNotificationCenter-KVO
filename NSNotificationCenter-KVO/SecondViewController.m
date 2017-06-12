//
//  SecondViewController.m
//  NSNotificationCenter-KVO
//
//  Created by Harry Li on 2017-06-11.
//  Copyright © 2017 Harry. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()
@property (weak, nonatomic) IBOutlet UILabel *counterLabel;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleUpdate:) name:@"DataUpdated" object:nil];

}

-(void)handleUpdate:(NSNotification *) notification{
   NSNumber *stepperValue = [[notification userInfo] valueForKey:@"stepperValue"];
    
    self.counterLabel.text = [NSString stringWithFormat:@"%.0f", stepperValue.doubleValue];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
