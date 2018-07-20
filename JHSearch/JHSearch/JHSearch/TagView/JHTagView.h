//
//  JHTagView.h
//  JHTagView
//
//  Created by HWA on 2018/7/3.
//  Copyright © 2018年 HWA. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JHTagView;

@protocol JHTagViewDelegate<NSObject>


@optional
- (void)tagView:(JHTagView *)tagView updateViewSize:(CGSize)size;
- (void)tagView:(JHTagView *)tagView collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface JHTagView : UIView


@property (weak, nonatomic) id<JHTagViewDelegate> delegate;


- (void)reloadTagViewWithTags:(NSArray *)tags;

@end
