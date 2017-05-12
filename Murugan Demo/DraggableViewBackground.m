//
//  DraggableViewBackground.m
//  Murugan Demo
//
//  Created by murugan on 13/05/17.
//  Copyright © 2017 murugan. All rights reserved.
//

#import "DraggableViewBackground.h"

@implementation DraggableViewBackground{
    NSInteger cardsLoadedIndex;
    NSMutableArray *loadedCards;
}
static const int MAX_BUFFER_SIZE = 2;
CGFloat swidth,sheight;
@synthesize countLabel;
@synthesize allCards;
CGRect *frames;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        CGRect screenRect = [[UIScreen mainScreen] bounds];
        swidth = screenRect.size.width;
        sheight = screenRect.size.height;
        [super layoutSubviews];
        countLabel = [[NSArray alloc]initWithObjects:@"01",@"02",@"03",@"04",@"05", nil];
        loadedCards = [[NSMutableArray alloc] init];
        allCards = [[NSMutableArray alloc] init];
        cardsLoadedIndex = 0;
        [self loadCards];
    }
    return self;
}
-(DraggableView *)createDraggableViewWithDataAtIndex:(NSInteger)index
{
    DraggableView *draggableView;
        draggableView = [[DraggableView alloc]initWithFrame:CGRectMake(self.frame.origin.x-40,self.frame.origin.y-100, swidth-50,sheight-200)];
    
    draggableView.information.text = [countLabel objectAtIndex:index];
    draggableView.delegate = self;
    if(index==0)
        draggableView.backgroundColor=[self hexColor:@"#E84D3D"];
    else if(index==1)
        draggableView.backgroundColor=[self hexColor:@"#C13A2B"];
    else if(index==2)
        draggableView.backgroundColor=[self hexColor:@"#ECF1F1"];
    else draggableView.backgroundColor=[self hexColor:@"#E84D3D"];
    
    self.layer.masksToBounds = NO;
    self.layer.shadowOffset = CGSizeMake(-5,10);
    self.layer.shadowRadius = 2;
    self.layer.shadowOpacity = 0.2;
    return draggableView;
}
-(void)loadCards
{
    if([countLabel count] > 0) {
        NSInteger numLoadedCardsCap =(([countLabel count] > MAX_BUFFER_SIZE)?MAX_BUFFER_SIZE:[countLabel count]);
        for (int i = 0; i<[countLabel count]; i++) {
            DraggableView* newCard = [self createDraggableViewWithDataAtIndex:i];
            [allCards addObject:newCard];
            
            if (i<numLoadedCardsCap) {
                [loadedCards addObject:newCard];
            }
        }
        for (int i = 0; i<[loadedCards count]; i++) {
            if (i>0) {
                [self insertSubview:[loadedCards objectAtIndex:i] belowSubview:[loadedCards objectAtIndex:i-1]];
            } else {
                [self addSubview:[loadedCards objectAtIndex:i]];
            }
            cardsLoadedIndex++;
        }
    }
}
-(void)cardSwipedLeft:(UIView *)card;
{
    [loadedCards removeObjectAtIndex:0];
    
    if (cardsLoadedIndex < [allCards count]) {
        [loadedCards addObject:[allCards objectAtIndex:cardsLoadedIndex]];
        cardsLoadedIndex++;
        [self insertSubview:[loadedCards objectAtIndex:(MAX_BUFFER_SIZE-1)] belowSubview:[loadedCards objectAtIndex:(MAX_BUFFER_SIZE-2)]];
    }
}
-(void)cardSwipedRight:(UIView *)card
{
    [loadedCards removeObjectAtIndex:0];
    
    if (cardsLoadedIndex < [allCards count]) {
        [loadedCards addObject:[allCards objectAtIndex:cardsLoadedIndex]];
        cardsLoadedIndex++;
        [self insertSubview:[loadedCards objectAtIndex:(MAX_BUFFER_SIZE-1)] belowSubview:[loadedCards objectAtIndex:(MAX_BUFFER_SIZE-2)]];
    }

}
-(void)swipeRight
{
    DraggableView *dragView = [loadedCards firstObject];
    [UIView animateWithDuration:0.2 animations:^{
    }];
    [dragView rightClickAction];
}
-(void)swipeLeft
{
    DraggableView *dragView = [loadedCards firstObject];
    [UIView animateWithDuration:0.2 animations:^{
    }];
    [dragView leftClickAction];
}
-(UIColor *)hexColor:(NSString *)color_code {
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:color_code];
    [scanner setScanLocation:1];
    [scanner scanHexInt:&rgbValue];
    
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
}
@end
