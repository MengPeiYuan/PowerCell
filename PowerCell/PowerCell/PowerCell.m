//
//  PowerCell.m
//  PowerCell
//
//  Created by jit-mac on 16/8/30.
//  Copyright © 2016年 LLH. All rights reserved.
//

#import "PowerCell.h"

@interface PowerCell ()

@property(nonatomic,strong)UILabel *timeLabel;

@end
@implementation PowerCell



- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUp];
    }
    return self;
}
-(void)setUp{
    //其实 cell 自带的 lable 默认的numberOfLines是等于1
    //默认的文字这段方式是NSLineBreakByTruncatingTail,例如:我是一个伤心的流浪狗...
    self.textLabel.numberOfLines=2;
    [self.textLabel setFont:[UIFont systemFontOfSize:14.0f]];
    
    self.detailTextLabel.numberOfLines=2;
    [self.detailTextLabel setFont:[UIFont systemFontOfSize:10.0f]];
     self.detailTextLabel.textColor=[UIColor grayColor];

    self.timeLabel=[[UILabel alloc]init];
    [self.timeLabel setFont:[UIFont systemFontOfSize:14.0f]];
     self.timeLabel.textColor=[UIColor colorWithRed:159.0/255.0 green:159.0/255.0 blue:159.0/255.0 alpha:1.0];
    [self.contentView addSubview:self.timeLabel];
    

}
- (void)refreshCellWithModel:(Model *)model{//通过 model 刷新 cell,给 cell 赋值
    if ([model.image_no isEqualToString:@"YES"]) {//用来展示没有图片是个什么样子
        [self.imageView sd_setImageWithURL:[NSURL URLWithString:model.head] placeholderImage:imageHolder];
    }else{
        [self.imageView setImage:nil];
    }
    [self.textLabel setText:model.title];
    [self.detailTextLabel setText:model.detail];
    [self.timeLabel setText:model.time];
}
- (void)setFrame:(CGRect)frame//用来修改cell内边距
{
    static CGFloat margin = paddingCell;
    frame.origin.x = margin;
    frame.size.width -= 2 * frame.origin.x;
    frame.size.height=frame.size.height-4;
    frame.origin.y=frame.origin.y+2;
    [super setFrame:frame];
}
-(void)layoutSubviews{
    [super layoutSubviews];//继承父类,重新绘制各个子视图的位置

    self.imageView.frame=CGRectMake(0.0, self.imageView.frame.origin.y+paddingCell, self.imageView.frame.size.width-paddingCell*2, self.imageView.frame.size.height-paddingCell*2);
    self.timeLabel.frame=CGRectMake(self.contentView.bounds.size.width-80.0, self.textLabel.frame.origin.y, 80.0, self.textLabel.frame.size.height);
    self.textLabel.frame=CGRectMake(CGRectGetMaxX(self.imageView.frame)+paddingCell, self.textLabel.frame.origin.y, self.contentView.bounds.size.width-CGRectGetMaxX(self.imageView.frame)-paddingCell-80.0,  self.textLabel.frame.size.height);
    
    self.detailTextLabel.frame=CGRectMake(CGRectGetMaxX(self.imageView.frame)+paddingCell, self.detailTextLabel.frame.origin.y, self.contentView.bounds.size.width-(CGRectGetMaxX(self.imageView.frame)+paddingCell), self.detailTextLabel.frame.size.height);
}
- (void)drawRect:(CGRect)rect {//给 cell 下方来一条分界线(颜色自定)
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.30].CGColor);
    CGContextFillRect(context, CGRectMake(0, CGRectGetHeight(self.frame) - 1.0, CGRectGetWidth(self.frame), 1.0));
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
