//
//  PowerCell.h
//  PowerCell
//
//  Created by jit-mac on 16/8/30.
//  Copyright © 2016年 LLH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model.h"
#import "UIImageView+WebCache.h"

#define paddingCell 10.0f
#define CellHeight (62.0+paddingCell*2)
#define imageHolder [UIImage imageNamed:@"nn.png"]


@interface PowerCell : UITableViewCell

- (void)refreshCellWithModel:(Model *)model;


@end
