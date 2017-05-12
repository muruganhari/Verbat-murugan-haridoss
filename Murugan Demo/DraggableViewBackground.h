//
//  DraggableViewBackground.h
//  Murugan Demo
//
//  Created by murugan on 13/05/17.
//  Copyright © 2017 murugan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DraggableView.h"

@interface DraggableViewBackground : UIView <DraggableViewDelegate>
-(void)cardSwipedLeft:(UIView *)card;
-(void)cardSwipedRight:(UIView *)card;
-(void)swipeRight;
-(void)swipeLeft;
@property (retain,nonatomic)NSArray* countLabel;
@property (retain,nonatomic)NSMutableArray* allCards;


@end
