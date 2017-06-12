//
//  ForthViewController.m
//  NSNotificationCenter-KVO
//
//  Created by Harry Li on 2017-06-11.
//  Copyright © 2017 Harry. All rights reserved.
//

#import "ForthViewController.h"
#import "CustomView.h"

@interface ForthViewController ()

@property (weak, nonatomic) IBOutlet UIView *yellowView;
@property (weak, nonatomic) IBOutlet CustomView *whiteView;

@end

@implementation ForthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.whiteView addObserver:self forKeyPath:@"point" options:NSKeyValueObservingOptionNew context:nil];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    if([keyPath isEqualToString:@"point"]){
        NSValue *value = change[NSKeyValueChangeNewKey];
        CGPoint point = value.CGPointValue;
        
        CGFloat yellowX = self.yellowView.center.x;
        CGFloat yellowY = self.yellowView.center.y;
        
        yellowX += point.x;
        yellowY += point.y;
        
        CGPoint newCenter = CGPointMake(yellowX, yellowY);
        self.yellowView.center = newCenter;
    }
}

- (IBAction)panWhiteView:(UIPanGestureRecognizer *)sender {
    CGPoint point = [sender translationInView:self.view];
    self.whiteView.point = point;
    [sender setTranslation:CGPointZero inView:self.view];
}

@end
