//
//  ViewController.m
//  01-UIViewLayerOps
//
//  Created by qingyun on 15/12/8.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *ctmView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)modifyLayer:(id)sender {
    _ctmView.layer.cornerRadius = 25;
    NSLog(@">>%@", [_ctmView.layer actionForKey:@"backgroundColor"]);
    
    [UIView beginAnimations:nil context:NULL];
    NSLog(@"<<%@", [_ctmView.layer actionForKey:@"backgroundColor"]);    
    [UIView commitAnimations];
}

@end
