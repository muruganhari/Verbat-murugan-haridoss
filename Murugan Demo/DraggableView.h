//
//  DraggableView.h
//  Murugan Demo
//
//  Created by murugan on 13/05/17.
//  Copyright © 2017 murugan. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DraggableViewDelegate <NSObject>

-(void)cardSwipedLeft:(UIView *)card;
-(void)cardSwipedRight:(UIView *)card;

@end

@interface DraggableView : UIView

@property (weak) id <DraggableViewDelegate> delegate;

@property (nonatomic, strong)UIPanGestureRecognizer *panGestureRecognizer;
@property (nonatomic)CGPoint originalPoint;
@property (nonatomic,strong)UILabel* information;

-(void)leftClickAction;
-(void)rightClickAction;

@end
