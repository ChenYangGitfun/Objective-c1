//
//  NewViewController.h
//  Objective-C1
//
//  Created by He on 2018/3/15.
//  Copyright © 2018年 He. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^NewBlock)(NSString*);

@protocol NewDelegate
- (void)sendInfo:(NSString*)info;
@end
@interface NewViewController : UIViewController
@property (nonatomic,weak)id<NewDelegate> delegate;
@property (nonatomic,copy)NewBlock newBlock;
@end
