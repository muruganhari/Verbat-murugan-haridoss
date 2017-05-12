//
//  ViewController.m
//  Murugan Demo
//
//  Created by murugan on 13/05/17.
//  Copyright © 2017 murugan. All rights reserved.
//

#import "ViewController.h"
#import "DraggableViewBackground.h"

@interface ViewController ()

@end

@implementation ViewController
DraggableViewBackground *draggableBackground;
- (void)viewDidLoad {
    [super viewDidLoad];
    _lblNoRecords.text=@"No records found please reload it !!!...";
     [self reload];
}
-(void)reload
{
    draggableBackground = [[DraggableViewBackground alloc]initWithFrame:_childView.frame];
    [_childView addSubview:draggableBackground];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)btnRight:(id)sender {
    [draggableBackground swipeRight];
}

- (IBAction)btnReload:(id)sender {
    [self reload];
}

- (IBAction)btnLeft:(id)sender {
    [draggableBackground swipeLeft];
}
@end
