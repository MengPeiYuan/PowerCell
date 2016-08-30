//
//  Model.h
//  PowerCell
//
//  Created by jit-mac on 16/8/30.
//  Copyright © 2016年 LLH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject

@property (nonatomic, copy) NSString *head;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *detail;
@property (nonatomic, copy) NSString *time;


@property (nonatomic,copy)  NSString *image_no;//用来展示没有图片是个什么样子

@end
