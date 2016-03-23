//
//  TAXTopic.m
//  BaiSiJie
//
//  Created by 谭安溪 on 16/3/18.
//  Copyright © 2016年 谭安溪. All rights reserved.
//

#import "TAXTopic.h"
#import "NSDate+TAXAdditions.h"
#import "MJExtension.h"
@implementation TAXTopic

+(NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{
             @"smallImage":@"image0",
             @"bigImage":@"image1",
             @"middleImage":@"image2"
             };
}

- (NSString *)create_time{
    
    NSDate *date = [NSDate date];
    NSDateFormatter *fm = [[NSDateFormatter alloc]init];
    fm.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSDate *create = [fm dateFromString:_create_time];
    NSDateComponents *comps = [date componentsFromDate:create];
    if ([create isThisYear]) {
        if ([create isToday]) {
            if (comps.hour>1) {
                return [NSString stringWithFormat:@"%zd小时前",comps.hour];
            }else if(comps.minute>1){
                return [NSString stringWithFormat:@"%zd分钟前",comps.minute];
            }else{
               return @"刚刚";
            }
        }else if ([create isYesterday]){
            fm.dateFormat = @"昨天HH:mm:ss";            
            return [fm stringFromDate:create];
        }else{
            fm.dateFormat = @"MM-dd HH:mm:ss";
            return [fm stringFromDate:create];
        }
    }else{
        return _create_time;
    }

}

- (CGFloat)TopicCellH{
    
    if (!_TopicCellH) {
        //顶部高度
        CGFloat topH = TAXTopicCellMargin + TAXTopicCellImageH;
        
        //中间文字高度
        CGSize textSize = [self.text boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width - 4*TAXTopicCellMargin, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil].size;
        CGFloat textH = textSize.height + TAXTopicCellMargin;
        //中间图片高度
        if (self.type == TAXTopicTypePicture) {
            CGFloat pictureH = self.height * ([UIScreen mainScreen].bounds.size.width - 4*TAXTopicCellMargin)/self.width;
            
            
            if (pictureH > TAXPictureMaxH) {
                pictureH = TAXPictureClipH;
                _bigPicture = YES;
            }
            _TopicCellH += pictureH;
            _pictureF = CGRectMake(TAXTopicCellMargin, topH + textH + TAXTopicCellMargin, [UIScreen mainScreen].bounds.size.width - 4*TAXTopicCellMargin, pictureH);
        }
        
        //底部的工具条高度
        CGFloat bottomH = TAXTopicCellBottomH;
        
        _TopicCellH += topH + textH + bottomH + 3 * TAXTopicCellMargin;
    }
    return _TopicCellH;
    
}

@end
