//
//  JHCollectionViewFlowLayout.m
//  JHSearch
//
//  Created by HWA on 2018/7/18.
//  Copyright © 2018年 HWA. All rights reserved.
//

#import "JHCollectionViewFlowLayout.h"

@interface JHCollectionViewFlowLayout ()

@property (nonatomic,strong)NSMutableDictionary *resoultDic;

@end

@implementation JHCollectionViewFlowLayout


- (instancetype)init
{
    if (self = [super init]) {
    }
    return self;
}

- (void)prepareLayout
{
    [super prepareLayout];
    self.minimumInteritemSpacing = 5;
}

- (nullable NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    // 获取所有元素，如有header 或者footer 也会包括
    NSMutableArray* attributes = [[super layoutAttributesForElementsInRect:rect] mutableCopy];
    self.resoultDic = [[NSMutableDictionary alloc]init];
    // 设置cell 等间距，根据需求可以修改
    NSInteger maximumSpacing = 5;
    for (int i = 0; i < [attributes count]; i++) {
        UICollectionViewLayoutAttributes *currentLayoutAttributes = attributes[i];
        // 排除 header footer
        if (currentLayoutAttributes.representedElementKind != nil) {
            continue;
        }
        // 获取 每个cell 的 y 值， 将所有的具有相同 y值的cell 加入数组 组合成 Key- Value
        NSString *currentWidth = [NSString stringWithFormat:@"%f",currentLayoutAttributes.frame.origin.y];
        if (![self.resoultDic.allKeys containsObject:currentWidth]) {
            NSMutableArray *dataArray = [[NSMutableArray alloc]init];
            [self.resoultDic setObject:dataArray forKey:currentWidth];
        }
        NSMutableArray *array = self.resoultDic[currentWidth];
        [array addObject:currentLayoutAttributes];
    }
    // 取出每一行cells，将第一个cell 的x 改变
    for (int i = 0; i < self.resoultDic.allKeys.count; i++) {
        NSString *key = self.resoultDic.allKeys[i];
        NSArray *valueArray = self.resoultDic[key];
        for (int j = 0; j < valueArray.count; j++) {
            UICollectionViewLayoutAttributes *JLayoutAttributes = valueArray[j];
            if (j == 0 ) {
                CGRect frame = JLayoutAttributes.frame;
                frame.origin.x = 0;//  修改成你想要的 值
                JLayoutAttributes.frame = frame;
            }else{
                UICollectionViewLayoutAttributes *prevLayoutAttributes = valueArray[j - 1];
                // 当cell 的个数大于2个的时候
                NSInteger origin = CGRectGetMaxX(prevLayoutAttributes.frame);
                CGRect frame = JLayoutAttributes.frame;
                frame.origin.x = origin + maximumSpacing;
                JLayoutAttributes.frame = frame;
            }
        }
    }
    return attributes;
}

@end
