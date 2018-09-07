//
//  JHTagCollectionViewCell.h
//  JHTagView
//
//  Created by HWA on 2018/7/3.
//  Copyright © 2018年 HWA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JHTagCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIButton *tagBtn;

@property (copy, nonatomic) NSString *title;

@end
