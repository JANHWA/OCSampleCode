//
//  PhotoCollectionViewCell.h
//  photoAlbum
//
//  Created by Justin on 2017/7/12.
//  Copyright © 2017年 Justin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

- (void)showImage:(UIImage *)image;

@end
