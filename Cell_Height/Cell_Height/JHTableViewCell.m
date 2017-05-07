//
//  JHTableViewCell.m
//  Cell_Height
//
//  Created by Justin on 2017/5/5.
//  Copyright © 2017年 Justin. All rights reserved.
//

#import "JHTableViewCell.h"
#import "Masonry.h"


@interface JHTableViewCell ()

@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UITextView *textView;

@end

@implementation JHTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self initView];
        
    }
    return self;
}

- (void)initView {
    
    self.titleLabel = [[UILabel alloc] init];
    [self.contentView addSubview:self.titleLabel];
    
    self.titleLabel.font = [UIFont systemFontOfSize:20];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView).insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
}

- (void)showContentWithTitle:(NSString *)title {
    
    self.titleLabel.text = title;
}

+ (JHTableViewCell *)showContentWithArray:(NSArray *)array
                                tableView:(UITableView *)tableView
                                indexPath:(NSIndexPath *)indexPath
                               identifier:(NSString *)identifier
{
    
    JHTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[JHTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:identifier];
    }
    [cell showContentWithTitle:array[indexPath.section][indexPath.row]];
    return cell;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
