//
//  JHChoiceTableViewCell.m
//  UITableView+ChoiseCell
//
//  Created by Justin on 2017/5/11.
//  Copyright © 2017年 Justin. All rights reserved.
//

#import "JHChoiceTableViewCell.h"
#import "Masonry.h"
#import "JHChoiceModel.h"

@implementation JHChoiceTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

#pragma mark - lazy Method

- (UIButton *)button {
    
    if (_button == nil) {
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        [_button setBackgroundImage:[UIImage imageNamed:@"button_unselect"] forState:UIControlStateNormal];
        [_button setBackgroundImage:[UIImage imageNamed:@"button_selected"] forState:UIControlStateSelected];
        [_button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_button];
    }
    return _button;
}

- (UILabel *)titleLabel {
    
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:15.0];
        [self.contentView addSubview:_titleLabel];
    }
    
    return _titleLabel;
}
#pragma mark - initial Method

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self layout];
    }
    return self;
}

#pragma mark - private Method

- (void)layout {
    
    [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(15);
        make.centerY.equalTo(self.contentView);
        make.width.height.equalTo(self.contentView.mas_height).multipliedBy(0.6);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.centerY.equalTo(self.button);
        make.left.equalTo(self.button.mas_right).offset(5);
        make.right.equalTo(self.contentView.mas_centerX);
    }];
}

- (void)buttonClick:(UIButton *)sender {
    if (_buttonBlock) {
        sender.selected = !sender.isSelected;
        _buttonBlock(sender);
    }
}

- (void)showContentWithModel:(JHChoiceModel *)model {
    
    if (model.state == 1) {
        self.button.selected = YES;
    } else {
        self.button.selected = NO;
    }
    self.titleLabel.text = model.title;
}

#pragma mark - public Method

- (void)buttonBlock:(ButtonBlock)buttonBlock {
    _buttonBlock = buttonBlock;
}

+ (JHChoiceTableViewCell *)showContentWithTableView:(UITableView *)tableView
                                          indexPath:(NSIndexPath *)indexPath
                                         identifier:(NSString *)identifier
                                         titleArray:(NSArray *)titleArray {
    
    JHChoiceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[JHChoiceTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:identifier];
    }
    [cell showContentWithModel:titleArray[indexPath.row]];
    return cell;
}

#pragma mark - protocol Method


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
