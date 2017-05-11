//
//  JHChoiceModel.h
//  UITableView+ChoiseCell
//
//  Created by Justin on 2017/5/11.
//  Copyright © 2017年 Justin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JHChoiceModel : NSObject

@property (copy, nonatomic) NSString *title;
@property (assign, nonatomic) NSUInteger state;//0:未选择 1：已选贼

@end
