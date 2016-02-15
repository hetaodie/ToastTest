//
//  ToastObject.m
//  ToastTest
//
//  Created by Netease on 16/2/4.
//  Copyright © 2016年 Netease. All rights reserved.
//

#import "ToastObject.h"

@implementation ToastObject

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.toastPoint = ShowToastAtModdle;
        self.showImage = nil;
        self.message = nil;
        self.showTime = 1.5f;
        self.showImagePoint = ShowImageAtUp;
    }
    return self;
}

//用来描述打印出来时的显示
- (NSString *)description
{
    NSDictionary *descriptionDictionary = @{@"toastPoint" : @(self.toastPoint),
                                            @"showImage"  : self.showImage,
                                            @"message"    : self.message,
                                            @"showTime"   : @(self.showTime),
                                            @"showImagePoint" : @(self.showImagePoint)
                                            };
    return [NSString stringWithFormat:@"%@", descriptionDictionary];
}

- (void)dealloc
{
    
}
@end
