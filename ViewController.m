//
//  ViewController.m
//  ToastTest
//
//  Created by Netease on 16/2/4.
//  Copyright © 2016年 Netease. All rights reserved.
//

#import "ViewController.h"
#import "ToastUtils.h"
#import "ToastObject.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}


- (IBAction)showInTopMessage:(id)sender {
    [ToastUtils showAtTop:@"魏旭进行测试魏旭进行测试魏旭进行测试魏旭进行测试"];
    
}

- (IBAction)showInMiddleMessage:(id)sender {
    [ToastUtils showAtMiddle:@"魏旭进行测试魏旭进行测试魏旭进行测试魏旭进行测试"];
}

- (IBAction)showInBottomMessage:(id)sender {
    [ToastUtils showAtBottom:@"魏旭进行测试魏旭进行测试魏旭进行测试魏旭进行测试"];
}

- (IBAction)showInRectMessage:(id)sender {
//    ShowToast(@"魏旭进行测试");
}

- (IBAction)showInTop:(id)sender {
    ToastObject *toastObject = [[ToastObject alloc] init];
    toastObject.showImage = [UIImage imageNamed:@"toastTest"];
    toastObject.showImagePoint = ShowImageAtLeft;
    toastObject.message = @"魏旭进行测试魏旭进行测试魏旭进行测试魏旭进行测试";
    toastObject.toastPoint = ShowToastAtTop;
    toastObject.showTime = 2.0;
    [ToastUtils showToastIncludeImage:toastObject];
}

- (IBAction)showInMiddle:(id)sender {
    ToastObject *toastObject = [[ToastObject alloc] init];
    toastObject.showImage = [UIImage imageNamed:@"toastTest"];
    toastObject.showImagePoint = ShowImageAtRight;
    toastObject.message = @"魏旭进行测试魏旭进行测试魏旭进行测试魏旭进行测试";
    toastObject.toastPoint = ShowToastAtModdle;
    toastObject.showTime = 5.0;
    [ToastUtils showToastIncludeImage:toastObject];

}

- (IBAction)showInBottom:(id)sender {
    ToastObject *toastObject = [[ToastObject alloc] init];
    toastObject.showImage = [UIImage imageNamed:@"toastTest"];
    toastObject.showImagePoint = ShowImageAtBelow;
    toastObject.message = @"魏旭进行测试魏旭进行测试魏旭进行测试魏旭进行测试";
    toastObject.toastPoint = ShowToastAtBottom;
    toastObject.showTime = 2.0;
    [ToastUtils showToastIncludeImage:toastObject];
}

@end
