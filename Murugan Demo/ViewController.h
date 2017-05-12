//
//  ViewController.h
//  Murugan Demo
//
//  Created by murugan on 13/05/17.
//  Copyright © 2017 murugan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIView *childView;
@property (strong, nonatomic) IBOutlet UILabel *lblNoRecords;
- (IBAction)btnRight:(id)sender;
- (IBAction)btnReload:(id)sender;
- (IBAction)btnLeft:(id)sender;


@end

