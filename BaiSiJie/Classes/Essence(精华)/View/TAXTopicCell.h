//
//  TAXTopicCell.h
//  BaiSiJie
//
//  Created by 谭安溪 on 16/3/18.
//  Copyright © 2016年 谭安溪. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TAXTopic;
@interface TAXTopicCell : UITableViewCell
@property (nonatomic, strong) TAXTopic *topic; ///<段子模型

+ (instancetype)topicCell;
@end
