//
//  FirstViewController.m
//  NSNotificationCenter-KVO
//
//  Created by Harry Li on 2017-06-11.
//  Copyright © 2017 Harry. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()
@property (weak, nonatomic) IBOutlet UIStepper *stepper;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.stepper.value = 0.0;
}

- (IBAction)stepperClicked:(UIStepper *)sender {
    NSNumber *stepperValue = [NSNumber numberWithDouble:self.stepper.value];
    
    NSDictionary *userInfo = @{@"stepperValue" : stepperValue};
    
    NSNotification *update = [[NSNotification alloc] initWithName:@"DataUpdated" object:nil userInfo:userInfo];
    
    [[NSNotificationCenter defaultCenter] postNotification:update];
    
}

@end
