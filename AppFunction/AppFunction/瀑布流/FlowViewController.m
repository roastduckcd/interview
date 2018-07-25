//
//  FlowViewController.m
//  AppFunction
//
//  Created by yang song on 2018/7/3.
//  Copyright © 2018 yangsong. All rights reserved.
//

#import "FlowViewController.h"
#import "UIImage+RDThumbnail.h"

@interface FlowViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *oldImageView;
@property (weak, nonatomic) IBOutlet UIImageView *scaledImageView;

@property (nonatomic, strong) UIImage *image;
@property (nonatomic, assign) BOOL isClicked;

@end

@implementation FlowViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.isClicked = NO;

    NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"jpg"];
    self.image  = [UIImage imageWithContentsOfFile:imagePath];

    self.oldImageView.image = self.image;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CGSize size = CGSizeMake(self.image.size.width / 10, self.image.size.height / 10);
    if (_isClicked) {
        NSLog(@"new");
        // 使用UIImage.h 中提供的c函数, 图像品质
        // jpeg 图像
//        self.oldImageView.image = [UIImage imageWithData:UIImageJPEGRepresentation(self.image, 0.6)];

//        self.oldImageView.image = [self.image scaleImageToSizeByUIkit:size scale:0.0];// 感觉没啥区别
        self.oldImageView.image = [self.image scaleImageToSizeByCGGraphiscs:size];//感觉有些许上下拉伸，模糊
//        self.oldImageView.image = [self.image scaleImageToSizeByImageIO:size];// 感觉没啥区别
//        self.oldImageView.image = [self.image scaleImageToSizeByCoreImage:size];// 貌似相当消耗性能
        //TODO: vImage技术原理
//        self.oldImageView.image = [self.image scaleImageToSizeByVImage:size];//失败
    } else {
        NSLog(@"old");
        self.oldImageView.image = self.image;
    }
    _isClicked = !_isClicked;
}

@end
