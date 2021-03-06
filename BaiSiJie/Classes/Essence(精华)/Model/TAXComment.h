//
//  TAXComment.h
//  BaiSiJie
//
//  Created by 谭安溪 on 16/3/30.
//  Copyright © 2016年 谭安溪. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TAXUser.h"
@interface TAXComment : NSObject
/** 音频文件的时长 */
@property (nonatomic, assign) NSInteger voicetime;

@property (nonatomic, copy) NSString *voiceuri; ///<音频链接

/** 评论的文字内容 */
@property (nonatomic, copy) NSString *content;
/** 被点赞的数量 */
@property (nonatomic, assign) NSInteger like_count;

@property (nonatomic, strong) TAXUser *user; ///<用户模型
@property (nonatomic, copy) NSString *ID;

@property (nonatomic, assign,readonly) CGFloat commentCellH; ///<自定义属性

@end
