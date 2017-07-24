//
//  PhotoCollectionViewCell.m
//  photoAlbum
//
//  Created by Justin on 2017/7/12.
//  Copyright © 2017年 Justin. All rights reserved.
//

#import "PhotoCollectionViewCell.h"

@implementation PhotoCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.backgroundColor = [UIColor redColor];
}

- (void)showImage:(UIImage *)image {
    self.imageView.image = image;
}

@end
