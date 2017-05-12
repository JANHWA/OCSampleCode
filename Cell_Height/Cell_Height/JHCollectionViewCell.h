//
//  JHCollectionViewCell.h
//  Cell_Height
//
//  Created by Justin on 2017/5/5.
//  Copyright © 2017年 Justin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ButtonBlock)(UIButton *sender);

@interface JHCollectionViewCell : UICollectionViewCell

@property (strong, nonatomic) UIImageView *imageV;
@property (strong, nonatomic) UIButton *deleBtn;


- (void)showContentWithImageName:(NSString *)imageName;

@property (copy, nonatomic) ButtonBlock btnBlock;

@end
